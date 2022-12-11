using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Queries.GetMatchesWithSummaries;

/// <summary>
/// Handler for GetMatchesSummaryQuery
/// </summary>
public sealed class GetMatchesWithSummariesQueryHandler : IQueryHandler<GetMatchesWithSummariesQuery, Paginated<MatchWithSummary>>
{
    /// <summary>
    /// Handle GetMatchesSummaryQuery queries
    /// </summary>
    public Task<Paginated<MatchWithSummary>> Handle(GetMatchesWithSummariesQuery request, CancellationToken cancellationToken)
    {
        throw new NotImplementedException();
    }
}