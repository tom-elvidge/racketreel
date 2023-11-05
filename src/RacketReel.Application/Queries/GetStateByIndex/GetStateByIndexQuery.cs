using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;

namespace RacketReel.Application.Queries.GetStateByIndex;

public sealed record GetStateByIndexQuery(int MatchId, int StateIndex)
    : IQuery<State>
{
}