using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;
using RacketReel.Application.Models.Match;

namespace RacketReel.Application.Queries.GetMatchById;

/// <summary>
/// Query for getting a match by its id
/// </summary>
public sealed record GetMatchByIdQuery(int MatchId): IQuery<Match>
{
}