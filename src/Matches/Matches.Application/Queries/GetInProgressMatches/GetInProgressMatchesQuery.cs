using Matches.Application.Abstractions.Messaging;
using Matches.Application.Models;
using Matches.Application.Models.Match;
using Matches.Domain.AggregatesModel.MatchAggregate;

namespace Matches.Application.Queries.GetInProgressMatches;

public sealed record GetInProgressMatchesQuery(int PageSize, int PageNumber, string[]? UserIds)
    : IQuery<Paginated<(Metadata, State)>>
{
}