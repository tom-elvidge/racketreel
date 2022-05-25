using RacketReel.Services.Matches.Domain.SeedWork;
using RacketReel.Services.Matches.Domain.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class SetType : Enumeration
{
    public static SetType SixAllAdvantageRule = new SetType(1, nameof(SixAllAdvantageRule).ToLowerInvariant());
    public static SetType SixAllTwelvePointTiebreaker = new SetType(2, nameof(SixAllTwelvePointTiebreaker).ToLowerInvariant());
    public static SetType SixAllTenPointTiebreaker = new SetType(2, nameof(SixAllTenPointTiebreaker).ToLowerInvariant());
    public static SetType WimbledonFinalSet = new SetType(2, nameof(WimbledonFinalSet).ToLowerInvariant());
    public static SetType SuperTiebreaker = new SetType(2, nameof(SuperTiebreaker).ToLowerInvariant());

    public SetType(int id, string name)
        : base(id, name)
    {
    }

    public static IEnumerable<SetType> List() =>
        new[] { SixAllAdvantageRule, SixAllTwelvePointTiebreaker, SixAllTenPointTiebreaker, WimbledonFinalSet, SuperTiebreaker };

    public static SetType FromName(string name)
    {
        var state = List()
            .SingleOrDefault(s => String.Equals(s.Name, name, StringComparison.CurrentCultureIgnoreCase));

        if (state == null)
        {
            throw new MatchesDomainException($"Possible values for SetType: {String.Join(",", List().Select(s => s.Name))}");
        }

        return state;
    }

    public static SetType From(int id)
    {
        var state = List().SingleOrDefault(s => s.Id == id);

        if (state == null)
        {
            throw new MatchesDomainException($"Possible values for OrderStatus: {String.Join(",", List().Select(s => s.Name))}");
        }

        return state;
    }
}
