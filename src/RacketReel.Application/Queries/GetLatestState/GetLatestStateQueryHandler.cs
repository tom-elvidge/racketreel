using RacketReel.Domain;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.SeedWork;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.DTOs;
using RacketReel.Application.Errors;

namespace RacketReel.Application.Queries.GetLatestState;

public class GetLatestStateQueryHandler : IQueryHandler<GetLatestStateQuery, State>
{
    private readonly IMediator _mediator;
    private readonly ILogger<GetLatestStateQueryHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    public GetLatestStateQueryHandler(
        IMediator mediator,
        ILogger<GetLatestStateQueryHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<State>> Handle(GetLatestStateQuery query, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(query.MatchId, true);
        
        if (matchEntity == null)
        {
            return Result.Failure<State>(ApplicationErrors.NotFound);
        }

        var stateEntity = matchEntity.States
            .OrderBy(s => s.CreatedAtDateTime)
            .LastOrDefault();

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