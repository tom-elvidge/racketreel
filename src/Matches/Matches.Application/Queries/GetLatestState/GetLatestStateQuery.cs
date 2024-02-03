using Matches.Application.Models;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.Models.Match;

namespace Matches.Application.Queries.GetLatestState;

public sealed record GetLatestStateQuery(int MatchId)
    : IQuery<State>
{
}