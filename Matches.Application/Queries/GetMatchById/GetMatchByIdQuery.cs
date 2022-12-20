using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Queries.GetMatchById;

/// <summary>
/// Query for getting a match by its id
/// </summary>
public sealed record GetMatchByIdQuery(int MatchId): IQuery<MatchDTO>
{
}