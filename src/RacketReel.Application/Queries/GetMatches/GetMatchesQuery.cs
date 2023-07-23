using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.DTOs;
using RacketReel.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Application.Queries.GetMatches;

public sealed record GetMatchesQuery(int PageSize, int PageNumber, MatchesOrderByEnum? OrderBy)
    : IQuery<Paginated<Match>>
{
}