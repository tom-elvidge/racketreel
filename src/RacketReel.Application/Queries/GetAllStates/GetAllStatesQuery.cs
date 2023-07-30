using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;

namespace RacketReel.Application.Queries.GetAllStates;

public sealed record GetAllStatesQuery(int MatchId)
    : IQuery<List<State>>
{
}