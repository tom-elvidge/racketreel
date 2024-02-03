using Matches.Application.Models;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.Models.Match;

namespace Matches.Application.Queries.GetAllStates;

public sealed record GetAllStatesQuery(int MatchId)
    : IQuery<List<State>>
{
}