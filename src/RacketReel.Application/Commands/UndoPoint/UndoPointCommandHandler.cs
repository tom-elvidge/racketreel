using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Errors;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.Exceptions;
using RacketReel.Domain.SeedWork;

namespace RacketReel.Application.Commands.UndoPoint;

public class UndoPointCommandHandler : ICommandHandler<UndoPointCommand>
{
    private readonly IMatchRepository _matchRepository;

    public UndoPointCommandHandler(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result> Handle(UndoPointCommand command, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(command.MatchId, true);
        
        if (matchEntity.UserId != command.UserId)
            return Result.Failure(ApplicationErrors.Unauthorized);

        try
        {
            matchEntity.Undo();
        }
        catch (CannotUndoInitialStateDomainException)
        {
            return Result.Failure(ApplicationErrors.DeleteInitialState);
        }

        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

        return Result.Success();
    }
}