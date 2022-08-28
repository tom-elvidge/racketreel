using System;
using RacketReel.Services.Matches.Domain.SeedWork;
using RacketReel.Services.Matches.Domain.Exceptions;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class State : Entity
{
    public DateTime CreatedDateTime { get; private set; }
    public Score Score { get; set; }
    public Participant Serving { get; set; }

    public State()
    {
    }

    public State(
        DateTime createdDateTime,
        Score score,
        Participant serving
    )
    {
        CreatedDateTime = createdDateTime;
        Score = score;
        Serving = serving;
    }

    public static State InitialState(Participant serving)
    {
        return new State(DateTime.UtcNow, new Score(0,0,0,0,0,0), serving);
    }

    public State Copy()
    {
        return new State(
            DateTime.UtcNow,
            this.Score.Copy(),
            this.Serving
        );
    }
}
