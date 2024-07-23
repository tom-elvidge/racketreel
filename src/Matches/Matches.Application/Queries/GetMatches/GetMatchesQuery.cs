using Matches.Application.Abstractions.Messaging;
using Matches.Application.Models;
using Matches.Application.Models.Match;
using Matches.Domain.AggregatesModel.MatchAggregate;

namespace Matches.Application.Queries.GetMatches;

public sealed record GetMatchesQuery(int PageSize, int PageNumber, string[]? UserIds = null)
    : IQuery<Paginated<Match>>
{
}