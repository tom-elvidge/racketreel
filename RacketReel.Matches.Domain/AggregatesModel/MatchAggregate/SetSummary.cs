using System;
using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.SeedWork;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class SetSummary : ValueObject
{
    public int Set { get; set; }
    public Participant Winner { get; set; }
    public DateTime CompletedDateTime { get; set; }
    public int ParticipantOneGames { get; set; }
    public int ParticipantTwoGames { get; set; }
    public bool TieBreak { get; set; }
    public int? ParticipantOneTieBreakPoints { get; set; }
    public int? ParticipantTwoTieBreakPoints { get; set; }

    public SetSummary()
    {
    }

    public SetSummary (
        int set,
        Participant winner,
        DateTime completedDateTime,
        int participantOneGames,
        int participantTwoGames,
        bool tieBreak,
        int? participantOneTieBreakPoints,
        int? participantTwoTieBreakPoints
    )
    {
        Set = set;
        Winner = winner;
        CompletedDateTime = completedDateTime;
        ParticipantOneGames = participantOneGames;
        ParticipantTwoGames = participantTwoGames;
        TieBreak = tieBreak;
        ParticipantOneTieBreakPoints = participantOneTieBreakPoints;
        ParticipantTwoTieBreakPoints = participantTwoTieBreakPoints;
    }

    protected override IEnumerable<object> GetEqualityComponents()
    {
        yield return Set;
        yield return Winner;
        yield return CompletedDateTime;
        yield return ParticipantOneGames;
        yield return ParticipantTwoGames;
        yield return TieBreak;
        yield return ParticipantOneTieBreakPoints;
        yield return ParticipantTwoTieBreakPoints;
    }
}