namespace RacketReel.Application.Models.Match;

public record Set(
    DateTime CompletedAtUtc,
    Team Winner,
    int TeamOneGames,
    int TeamTwoGames,
    bool TiebreakPlayed,
    int? TeamOneTiebreakPoints,
    int? TeamTwoTiebreakPoints);