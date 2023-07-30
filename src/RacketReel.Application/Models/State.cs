using RacketReel.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Application.Models;

public record State(
    int MatchId,
    int Version,
    DateTime CreatedAtUtc,
    Team Serving,
    int TeamOnePoints,
    int TeamTwoPoints,
    int TeamOneGames,
    int TeamTwoGames,
    int TeamOneSets,
    int TeamTwoSets,
    bool Highlighted,
    bool Tiebreak);