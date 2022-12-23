using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Queries.GetStateByIndex;

public sealed record GetStateByIndexQuery(int MatchId, int StateIndex)
    : IQuery<State>
{
}