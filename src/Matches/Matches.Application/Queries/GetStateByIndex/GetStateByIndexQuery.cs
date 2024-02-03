using Matches.Application.Models;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.Models.Match;

namespace Matches.Application.Queries.GetStateByIndex;

public sealed record GetStateByIndexQuery(int MatchId, int StateIndex)
    : IQuery<State>
{
}