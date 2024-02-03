namespace RacketReel.Application.Models.Match;

public record State(
    int MatchId,
    int StateId,
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
    bool Tiebreak,
    bool Completed);