using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.DTOs;

namespace RacketReel.Application.Queries.GetLatestState;

public sealed record GetLatestStateQuery(int MatchId)
    : IQuery<State>
{
}