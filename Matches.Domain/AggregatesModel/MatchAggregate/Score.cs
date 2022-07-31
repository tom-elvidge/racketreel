using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.SeedWork;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class Score : ValueObject
{
    public int ParticipantOnePoints { get; private set; }
    public int ParticipantTwoPoints { get; private set; }
    public int ParticipantOneGames { get; private set; }
    public int ParticipantTwoGames { get; private set; }
    public int ParticipantOneSets { get; private set; }
    public int ParticipantTwoSets { get; private set; }

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
}
