using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;
using Matches.Domain.AggregatesModel.MatchAggregate;

namespace Matches.Application.Queries.GetMatches;

public sealed record GetMatchesQuery(int PageSize, int PageNumber, MatchesOrderByEnum? OrderBy)
    : IQuery<Paginated<Match>>
{
}