using Matches.Application.Abstractions.Messaging;
using Matches.Application.Errors;
using Matches.Application.Services;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.Exceptions;
using Matches.Domain.SeedWork;

namespace Matches.Application.Commands.UndoPoint;

public class UndoPointCommandHandler : ICommandHandler<UndoPointCommand>
{
    private readonly IMatchRepository _matchRepository;
    private readonly IChannelProvider _channelProvider;

    public UndoPointCommandHandler(IMatchRepository matchRepository, IChannelProvider channelProvider)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
        _channelProvider = channelProvider;
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

        var latestState = StateCreator.CreateState(matchEntity, matchEntity.States.Last());
        
        var writers = _channelProvider.GetStateChannelWriters(command.MatchId);
        foreach (var writer in writers)
        {
            await writer.WriteAsync(latestState, cancellationToken);
        }

        return Result.Success();
    }
}