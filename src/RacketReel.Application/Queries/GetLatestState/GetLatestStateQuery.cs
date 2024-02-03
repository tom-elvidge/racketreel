using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;
using RacketReel.Application.Models.Match;

namespace RacketReel.Application.Queries.GetLatestState;

public sealed record GetLatestStateQuery(int MatchId)
    : IQuery<State>
{
}