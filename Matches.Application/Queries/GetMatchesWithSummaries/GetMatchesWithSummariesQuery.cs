using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Queries.GetMatchesWithSummaries;

/// <summary>
/// Query for getting a collection of completed matches with their summaries
/// </summary>
public sealed class GetMatchesWithSummariesQuery: IQuery<Paginated<MatchWithSummary>>
{
    /// <summary>
    /// The maximum number of matches to include on a page.
    /// </summary>
    public int PageSize { get; init; }

    /// <summary>
    /// The page of matches to get.
    /// </summary>
    public int PageNumber { get; init; }

    /// <summary>
    /// How to order the collection of matches.
    /// </summary>
    public MatchesOrderByEnum OrderBy { get; init; }

    /// <summary>
    /// Constructor for setting defaults if null
    /// <param name="pageSize">The maximum number of matches to include on a page. Defaults to 10.</param>
    /// <param name="pageNumber">The page of matches to get. Defaults to 1.</param>
    /// <param name="orderBy">How to order the collection of matches. Defaults to the date and time the match was created.</param>
    /// </summary>
    public GetMatchesWithSummariesQuery(int? pageSize, int? pageNumber, MatchesOrderByEnum? orderBy)
    {
        PageSize = pageSize ?? 10;
        PageNumber = pageNumber ?? 1;
        OrderBy = orderBy ?? MatchesOrderByEnum.CreatedAt;
    }
}