using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Errors;
using RacketReel.Application.Models;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.Exceptions;
using RacketReel.Domain.SeedWork;

namespace RacketReel.Application.Commands.AddPoint;

public class AddPointCommandHandler : ICommandHandler<AddPointCommand>
{
    private readonly IMatchRepository _matchRepository;

    public AddPointCommandHandler(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result> Handle(AddPointCommand command, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(command.MatchId, true);

        if (matchEntity == null)
            return Result.Failure(ApplicationErrors.NotFound);
        
        try
        {
            matchEntity.Update(command.Team == Team.TeamOne ? ParticipantEnum.One : ParticipantEnum.Two);
        }
        catch (CannotUpdateACompletedMatchDomainException)
        {
            return Result.Failure(ApplicationErrors.UpdateCompletedMatch);
        }
        
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        return Result.Success();
    }
}