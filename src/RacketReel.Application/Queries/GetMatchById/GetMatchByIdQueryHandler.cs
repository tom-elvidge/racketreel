using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.SeedWork;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.DTOs;
using RacketReel.Application.Errors;
using RacketReel.Application.Services;

namespace RacketReel.Application.Queries.GetMatchById;

public sealed class GetMatchByIdQueryHandler : IQueryHandler<GetMatchByIdQuery, Match>
{
    private readonly IMediator _mediator;
    private readonly ILogger<GetMatchByIdQueryHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    public GetMatchByIdQueryHandler(
        IMediator mediator,
        ILogger<GetMatchByIdQueryHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<Match>> Handle(GetMatchByIdQuery query, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(query.MatchId, true);
        
        if (matchEntity == null)
            return Result.Failure<Match>(ApplicationErrors.NotFound);

        var match = Match.Create(matchEntity);

        if (matchEntity.IsComplete())
            match.Summary = SummaryService.ComputeMatchSummary(matchEntity);

        return Result.Success<Match>(match);
    }
}