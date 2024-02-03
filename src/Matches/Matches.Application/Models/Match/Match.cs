namespace Matches.Application.Models.Match;

public record Match(
    int Id,
    string UserId,
    DateTime CreatedAt,
    DateTime CompletedAt,
    Format Format,
    string TeamOneName,
    string TeamTwoName,
    Team Winner,
    Set SetOne,
    Set? SetTwo,
    Set? SetThree,
    Set? SetFour,
    Set? SetFive);