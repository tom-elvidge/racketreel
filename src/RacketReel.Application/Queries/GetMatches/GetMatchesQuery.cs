using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;
using RacketReel.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Application.Queries.GetMatches;

public sealed record GetMatchesQuery(int PageSize, int PageNumber)
    : IQuery<Paginated<Match>>
{
}