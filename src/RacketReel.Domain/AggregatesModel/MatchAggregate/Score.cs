using RacketReel.Domain.SeedWork;

namespace RacketReel.Domain.AggregatesModel.MatchAggregate;

public class Score : ValueObject
{
    public int P1Points { get; private set; }

    public int P2Points { get; private set; }

    public int P1Games { get; private set; }

    public int P2Games { get; private set; }

    public int P1Sets { get; private set; }

    public int P2Sets { get; private set; }

    public Score (
        int p1Points,
        int p2Points,
        int p1Games,
        int p2Games,
        int p1Sets,
        int p2Sets)
    {
        P1Points = p1Points;
        P2Points = p2Points;
        P1Games = p1Games;
        P2Games = p2Games;
        P1Sets = p1Sets;
        P2Sets = p2Sets;
    }

    protected override IEnumerable<object> GetEqualityComponents()
    {
        yield return P1Points;
        yield return P2Points;
        yield return P1Games;
        yield return P2Games;
        yield return P1Sets;
        yield return P2Sets;
    }

    public static Score Initial()
    {
        return new Score(0,0,0,0,0,0);
    }

    public Score Copy()
    {
        return new Score(P1Points, P2Points, P1Games, P2Games, P1Sets, P2Sets);
    }

    public void IncrementSets(ParticipantEnum participant)
    {
        if (participant == ParticipantEnum.One)
        {
            P1Sets++;
        }
        if (participant == ParticipantEnum.Two)
        {
            P2Sets++;
        }

        // reset games and points
        P1Games = 0;
        P2Games = 0;
        P1Points = 0;
        P2Points = 0;
    }

    public void IncrementGames(ParticipantEnum participant)
    {
        if (participant == ParticipantEnum.One)
        {
            P1Games++;
        }
        if (participant == ParticipantEnum.Two)
        {
            P2Games++;
        }

        // reset points
        P1Points = 0;
        P2Points = 0;
    }

    public void IncrementPoints(ParticipantEnum participant)
    {
        if (participant == ParticipantEnum.One)
        {
            P1Points++;
        }
        if (participant == ParticipantEnum.Two)
        {
            P2Points++;
        }
    }

    public void DecrementPoints(ParticipantEnum participant)
    {
        if (participant == ParticipantEnum.One)
        {
            P1Points--;
        }
        if (participant == ParticipantEnum.Two)
        {
            P2Points--;
        }
    }
}