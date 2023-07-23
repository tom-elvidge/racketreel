using RacketReel.Domain;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.SeedWork;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.DTOs;
using RacketReel.Application.Errors;

namespace RacketReel.Application.Queries.GetStateByIndex;

public class GetStateByIndexQueryHandler : IQueryHandler<GetStateByIndexQuery, State>
{
    private readonly IMediator _mediator;
    private readonly ILogger<GetStateByIndexQueryHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    public GetStateByIndexQueryHandler(
        IMediator mediator,
        ILogger<GetStateByIndexQueryHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<State>> Handle(GetStateByIndexQuery query, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(query.MatchId, true);
        
        if (matchEntity == null)
        {
            return Result.Failure<State>(ApplicationErrors.NotFound);
        }

        StateEntity stateEntity = null;
        try
        {
            stateEntity = matchEntity.States
                .OrderBy(s => s.CreatedAtDateTime)
                .ToList()[query.StateIndex];
        }
        catch (ArgumentOutOfRangeException)
        {}

        if (stateEntity == null)
        {
            return Result.Failure<State>(ApplicationErrors.NotFound);
        }

        return Result.Success<State>(State.Create(
            matchEntity,
            stateEntity,
            Scorer.IsTiebreak(matchEntity.Format, stateEntity)));
    }
}