using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Queries.GetMatchById;

/// <summary>
/// Handler for GetMatchByIdQuery
/// </summary>
public sealed class GetMatchByIdQueryHandler : IQueryHandler<GetMatchByIdQuery, Match>
{

    /// <summary>
    /// Handle GetMatchByIdQuery queries
    /// </summary>
    public Task<Match> Handle(GetMatchByIdQuery query, CancellationToken cancellationToken)
    {
        throw new NotImplementedException();
    }
}