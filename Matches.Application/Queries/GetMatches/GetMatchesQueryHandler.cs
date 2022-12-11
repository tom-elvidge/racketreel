using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Queries.GetMatches;

/// <summary>
/// Handler for GetMatchesQuery
/// </summary>
public sealed class GetMatchesQueryHandler : IQueryHandler<GetMatchesQuery, Paginated<Match>>
{
    /// <summary>
    /// Handle GetMatchesQuery queries
    /// </summary>
    public Task<Paginated<Match>> Handle(GetMatchesQuery request, CancellationToken cancellationToken)
    {
        throw new NotImplementedException();
    }
}