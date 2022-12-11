using System;
using RacketReel.Services.Matches.Domain.SeedWork;
using RacketReel.Services.Matches.Domain.Exceptions;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class State : Entity
{
    public DateTime CreatedDateTime { get; private set; }
    public Score Score { get; set; }
    public Participant Serving { get; set; }
    public bool IsTieBreak { get; set; }
    public bool Highlight { get; set; }

    public State()
    {
    }

    public State(
        DateTime createdDateTime,
        Score score,
        Participant serving,
        bool isTieBreak
    )
    {
        CreatedDateTime = createdDateTime;
        Score = score;
        Serving = serving;
        IsTieBreak = isTieBreak;
        Highlight = false;
    }

    public static State InitialState(Participant serving)
    {
        return new State(DateTime.UtcNow, new Score(0,0,0,0,0,0), serving, false);
    }

    public State Copy()
    {
        return new State(
            DateTime.UtcNow,
            this.Score.Copy(),
            this.Serving,
            this.IsTieBreak
        );
    }
}
