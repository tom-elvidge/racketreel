using Matches.Application.Abstractions.Messaging;
using MediatR;
using Microsoft.Extensions.Logging;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.SeedWork;
using Matches.Application.DTOs;
using Matches.Application.Errors;
using Matches.Domain;

namespace Matches.Application.Commands.UpdateState;

public class UpdateStateCommandHandler : ICommandHandler<UpdateStateCommand, State>
{
    private readonly IMediator _mediator;
    private readonly ILogger<UpdateStateCommandHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    public UpdateStateCommandHandler(
        IMediator mediator,
        ILogger<UpdateStateCommandHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<State>> Handle(UpdateStateCommand command, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(command.MatchId, true);
        
        if (matchEntity == null)
        {
            return Result.Failure<State>(ApplicationErrors.NotFound);
        }

        StateEntity stateEntity = null;
        try
        {
            stateEntity = matchEntity.States
                .OrderBy(s => s.CreatedAtDateTime)
                .ToList()[command.StateIndex];
        }
        catch (ArgumentOutOfRangeException)
        {}

        if (stateEntity == null)
        {
            return Result.Failure<State>(ApplicationErrors.NotFound);
        }

        stateEntity.Highlight = command.Highlight;
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        
        return Result.Success<State>(State.Create(
            matchEntity,
            stateEntity,
            Scorer.IsTiebreak(matchEntity.Format, stateEntity)));
    }
}