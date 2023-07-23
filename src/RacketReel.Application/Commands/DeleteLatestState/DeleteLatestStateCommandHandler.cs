using RacketReel.Application.DTOs;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.SeedWork;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Errors;
using RacketReel.Domain.Exceptions;

namespace RacketReel.Application.Commands.DeleteLatestState;

public class DeleteLatestStateCommandHandler : ICommandHandler<DeleteLatestStateCommand>
{
    private readonly IMediator _mediator;
    private readonly ILogger<DeleteLatestStateCommandHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    public DeleteLatestStateCommandHandler(
        IMediator mediator,
        ILogger<DeleteLatestStateCommandHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result> Handle(DeleteLatestStateCommand command, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(command.MatchId, true);

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