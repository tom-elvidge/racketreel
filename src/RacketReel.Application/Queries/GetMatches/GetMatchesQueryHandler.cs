using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.SeedWork;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.DTOs;
using RacketReel.Application.Errors;
using RacketReel.Application.Services;

namespace RacketReel.Application.Queries.GetMatches;

public class GetMatchesQueryHandler : IQueryHandler<GetMatchesQuery, Paginated<Match>>
{
    private readonly IMediator _mediator;
    private readonly ILogger<GetMatchesQueryHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    public GetMatchesQueryHandler(
        IMediator mediator,
        ILogger<GetMatchesQueryHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<Paginated<Match>>> Handle(GetMatchesQuery query, CancellationToken cancellationToken)
    {
        Tuple<IEnumerable<MatchEntity>, int> result;
        try
        { 
            result = await _matchRepository.GetAsync(
                query.PageNumber,
                query.PageSize,
                query.OrderBy ?? MatchesOrderByEnum.CreatedAt,
                // need the states to compute the summary if getting completed match
                query.OrderBy == MatchesOrderByEnum.CompletedAt ? true : false);
        }
        catch (ArgumentException)
        {
            return Result.Failure<Paginated<Match>>(ApplicationErrors.NotFound);
        }

        var matchEntities = result.Item1;
        var totalPages = result.Item2;

        return Result.Success<Paginated<Match>>(new Paginated<Match>
        {
            PageSize = query.PageSize,
            PageNumber = query.PageNumber,
            PageCount = totalPages,
            Data = matchEntities.Select(matchEntity =>
                {
                    var match = Match.Create(matchEntity);
                    if (query.OrderBy == MatchesOrderByEnum.CompletedAt && matchEntity.IsComplete())
                        match.Summary = SummaryService.ComputeMatchSummary(matchEntity);
                    match.States = null;
                    return match;
                }).ToList()
        });
    }
}