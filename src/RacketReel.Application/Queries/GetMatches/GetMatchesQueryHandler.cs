using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.SeedWork;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Errors;
using RacketReel.Application.Models;
using RacketReel.Application.Services;

namespace RacketReel.Application.Queries.GetMatches;

public class GetMatchesQueryHandler : IQueryHandler<GetMatchesQuery, Paginated<Match>>
{
    private readonly IMatchRepository _matchRepository;

    public GetMatchesQueryHandler(IMatchRepository matchRepository)
    {
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
                MatchesOrderByEnum.CompletedAt,
                true);
        }
        catch (ArgumentException)
        {
            return Result.Failure<Paginated<Match>>(ApplicationErrors.NotFound);
        }

        var matchEntities = result.Item1;
        var totalPages = result.Item2;

        return Result.Success(new Paginated<Match>
        {
            PageSize = query.PageSize,
            PageNumber = query.PageNumber,
            PageCount = totalPages,
            Page = matchEntities.Select(MatchCreator.CreateMatch).ToList()
        });
    }
}