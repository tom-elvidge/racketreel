using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.SeedWork;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class Score : ValueObject
{
    public (int, int) Points { get; private set; }
    public (int, int) Games { get; private set; }
    public (int, int) Sets { get; private set; }

    public Score ((int, int) points, (int, int) games, (int, int) sets)
    {
        Points = points;
        Games = games;
        Sets = sets;
    }

    protected override IEnumerable<object> GetEqualityComponents()
    {
        yield return Points;
        yield return Games;
        yield return Sets;
    }
}
