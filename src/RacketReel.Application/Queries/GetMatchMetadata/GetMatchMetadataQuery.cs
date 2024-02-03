using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;
using RacketReel.Application.Models.Match;

namespace RacketReel.Application.Queries.GetMatchMetadata;

public sealed record GetMatchMetadataQuery(int MatchId) : IQuery<Metadata>
{
}