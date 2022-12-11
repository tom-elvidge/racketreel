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

        // todo: change to a command to attempt to get the summary
        // if it is not there then compute it and add it to the cache (maybe just a db for now)
        // every time a new state is added then invalidate the cache so this is recomputed
        throw new NotImplementedException();
    }
}