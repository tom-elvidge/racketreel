using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.SeedWork;
using RacketReel.Services.Matches.Domain.Exceptions;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class Format : ValueObject
{
    public int Sets { get; private set; }
    // Todo: Use Enums for SetType and FinalSetType
    public string SetType { get; private set; }
    public string FinalSetType { get; private set; }

    public Format(int sets, string setType, string finalSetType)
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
        SetType = setType;
        FinalSetType = finalSetType;
    }

    protected override IEnumerable<object> GetEqualityComponents()
    {
        yield return Sets;
        yield return SetType;
        yield return FinalSetType;
    }
}
