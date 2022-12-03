#nullable enable

namespace RacketReel.Services.Matches.API.Application.Dtos;

public class SetScoreDto
{
    public int Games { get; set; }
    public int? TieBreakPoints { get; set; }

    public SetScoreDto(int games, int? tieBreakPoints)
    {
        Games = games;
        TieBreakPoints = tieBreakPoints;
    }
}
