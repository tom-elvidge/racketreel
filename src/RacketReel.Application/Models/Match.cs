namespace RacketReel.Application.Models;

public record Match(
    int Id,
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