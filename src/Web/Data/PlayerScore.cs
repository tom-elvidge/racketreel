namespace RacketReel.Web.Data;

public class PlayerScore
{
    public int Points { get; private set; }
    public int Games { get; private set; }
    public int Sets { get; private set; }

    public PlayerScore(int points, int games, int sets)
    {
        Points = points;
        Games = games;
        Sets = sets;
    }
}
