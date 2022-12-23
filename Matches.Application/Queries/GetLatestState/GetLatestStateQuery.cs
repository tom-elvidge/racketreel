using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Queries.GetLatestState;

public sealed record GetLatestStateQuery(int MatchId)
    : IQuery<State>
{
}