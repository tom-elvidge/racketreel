using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.SeedWork;
using RacketReel.Services.Matches.Domain.Exceptions;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class Format : ValueObject
{
    public int Sets { get; private set; }

    public SetType NormalSetType { get; private set; }

    // Often matches uses a different set type for the final set
    public SetType FinalSetType { get; private set; }

    public Format()
    {
        // Setting non-null values but these will be overwritten by EF on get
        Sets = 3;
        NormalSetType = SetType.SixAllTwelvePointTiebreaker;
        FinalSetType = SetType.SixAllTwelvePointTiebreaker;
    }

    public Format(int sets, SetType normalSetType, SetType finalSetType)
    {
        if (sets % 2 == 0)
        {
            throw new MatchesDomainException("sets must be odd");
        }
        if (sets < 1)
        {
            throw new MatchesDomainException("sets must be at least one");
        }
        if (sets > 5)
        {
            throw new MatchesDomainException("sets cannot be greater than 5");
        }

        Sets = sets;
        NormalSetType = normalSetType;
        FinalSetType = finalSetType;
    }

    protected override IEnumerable<object> GetEqualityComponents()
    {
        yield return Sets;
        yield return NormalSetType;
        yield return FinalSetType;
    }
}
