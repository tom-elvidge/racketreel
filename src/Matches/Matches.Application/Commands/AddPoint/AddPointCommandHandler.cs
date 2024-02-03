using Matches.Application.Models;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.Errors;
using Matches.Application.Models.Match;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.Exceptions;
using Matches.Domain.SeedWork;

namespace Matches.Application.Commands.AddPoint;

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

        if (matchEntity.UserId != command.UserId)
            return Result.Failure(ApplicationErrors.Unauthorized);
        
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