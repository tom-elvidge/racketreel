using Matches.Application.Models;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.Models.Match;

namespace Matches.Application.Queries.GetMatchById;

/// <summary>
/// Query for getting a match by its id
/// </summary>
public sealed record GetMatchByIdQuery(int MatchId): IQuery<Match>
{
}