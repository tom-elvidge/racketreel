using Matches.Domain.SeedWork;

namespace Matches.Domain.AggregatesModel.MatchAggregate;

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
}