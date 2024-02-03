using Matches.Application.Models;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.Models.Match;

namespace Matches.Application.Queries.GetMatchMetadata;

public sealed record GetMatchMetadataQuery(int MatchId) : IQuery<Metadata>
{
}