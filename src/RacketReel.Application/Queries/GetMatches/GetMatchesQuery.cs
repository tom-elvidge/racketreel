using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;
using RacketReel.Application.Models.Match;
using RacketReel.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Application.Queries.GetMatches;

public sealed record GetMatchesQuery(int PageSize, int PageNumber)
    : IQuery<Paginated<Match>>
{
}