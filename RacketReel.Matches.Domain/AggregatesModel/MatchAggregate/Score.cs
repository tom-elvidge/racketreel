using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.SeedWork;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class Score : ValueObject
{
    public int ParticipantOnePoints { get; set; }
    public int ParticipantTwoPoints { get; set; }
    public int ParticipantOneGames { get; set; }
    public int ParticipantTwoGames { get; set; }
    public int ParticipantOneSets { get; set; }
    public int ParticipantTwoSets { get; set; }

    public Score()
    {
    }

    public Score (
        int participantOnePoints,
        int participantTwoPoints,
        int participantOneGames,
        int participantTwoGames,
        int participantOneSets,
        int participantTwoSets
    )
    {
        ParticipantOnePoints = participantOnePoints;
        ParticipantTwoPoints = participantTwoPoints;
        ParticipantOneGames = participantOneGames;
        ParticipantTwoGames = participantTwoGames;
        ParticipantOneSets = participantOneSets;
        ParticipantTwoSets = participantTwoSets;
    }

    protected override IEnumerable<object> GetEqualityComponents()
    {
        yield return ParticipantOnePoints;
        yield return ParticipantTwoPoints;
        yield return ParticipantOneGames;
        yield return ParticipantTwoGames;
        yield return ParticipantOneSets;
        yield return ParticipantTwoSets;
    }

    public Score InitialScore()
    {
        return new Score(0,0,0,0,0,0);
    }

    public Score Copy()
    {
        return new Score(
            this.ParticipantOnePoints,
            this.ParticipantTwoPoints,
            this.ParticipantOneGames,
            this.ParticipantTwoGames,
            this.ParticipantOneSets,
            this.ParticipantTwoSets
        );
    }

    public void ResetPoints()
    {
        this.ParticipantOnePoints = 0;
        this.ParticipantTwoPoints = 0;
    }

    public void ResetGames()
    {
        this.ParticipantOneGames = 0;
        this.ParticipantTwoGames = 0;
    }
}
