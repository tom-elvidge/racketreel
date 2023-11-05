using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;

namespace RacketReel.Application.Queries.GetMatchMetadata;

public sealed record GetMatchMetadataQuery(int MatchId) : IQuery<Metadata>
{
}