using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Queries.GetMatchSummaryById;

/// <summary>
/// Query for getting a match summary by the match id
/// </summary>
public sealed record GetMatchSummaryByIdQuery(int MatchId): IQuery<MatchWithSummary>
{
}