using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Queries.GetMatchSummaryById;

/// <summary>
/// Handler for GetMatchSummaryByIdQuery
/// </summary>
public sealed class GetMatchSummaryByIdQueryHandler : IQueryHandler<GetMatchSummaryByIdQuery, MatchWithSummary>
{

    /// <summary>
    /// Handle GetMatchSummaryByIdQuery queries
    /// </summary>
    public Task<MatchWithSummary> Handle(GetMatchSummaryByIdQuery query, CancellationToken cancellationToken)
    {
        throw new NotImplementedException();
    }
}