using System;
using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.SeedWork;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class MatchSummary : ValueObject
{
    public Participant Winner { get; set; }
    public DateTime CompletedDateTime { get; set; }
    public IList<SetSummary> Sets { get; set; }

    public MatchSummary()
    {
        CompletedDateTime = DateTime.Now;
        Sets = new List<SetSummary>();
    }

    public MatchSummary (
        Participant winner,
        DateTime completedDateTime,
        IList<SetSummary> sets
    )
    {
        Winner = winner;
        CompletedDateTime = completedDateTime;
        Sets = sets;
    }

    protected override IEnumerable<object> GetEqualityComponents()
    {
        yield return Winner;
        yield return CompletedDateTime;
        yield return Sets;
    }
}