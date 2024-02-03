using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;
using RacketReel.Application.Models.Match;

namespace RacketReel.Application.Queries.GetAllStates;

public sealed record GetAllStatesQuery(int MatchId)
    : IQuery<List<State>>
{
}