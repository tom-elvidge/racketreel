namespace RacketReel.Services.Matches.API.Application.Dtos;

public class PlayerScoreDto
{
    public int Points { get; private set; }
    public int Games { get; private set; }
    public int Sets { get; private set; }

    public PlayerScoreDto(int points, int games, int sets)
    {
        Points = points;
        Games = games;
        Sets = sets;
    }
}
