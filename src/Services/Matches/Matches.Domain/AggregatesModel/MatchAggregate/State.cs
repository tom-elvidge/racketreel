using System;
using RacketReel.Services.Matches.Domain.SeedWork;
using RacketReel.Services.Matches.Domain.Exceptions;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class State : Entity
{
    public DateTime CreatedDateTime { get; private set; }
    public Score Score { get; private set; }
    public int Serving { get; private set; }
    public bool IsTieBreak { get; private set; }
    public int TieBreakPointCounter { get; private set; }
    public string ServingAfterTieBreak { get; private set; }

    public State(
        DateTime createdDateTime,
        Score score,
        int serving,
        bool isTieBreak = false,
        int tieBreakPointCounter = 0,
        string servingAfterTieBreak = null
    )
    {
        if (!(serving == 0 || serving == 1))
        {
            throw new MatchesDomainException("serving must be either 0 or 1");
        }

        if (isTieBreak && servingAfterTieBreak == null)
        {
            throw new MatchesDomainException("servingAfterTieBreak cannot be null when isTieBreak is true");
        }

        CreatedDateTime = createdDateTime;
        Score = score;
        Serving = serving;
        IsTieBreak = isTieBreak;
        TieBreakPointCounter = tieBreakPointCounter;
        ServingAfterTieBreak = servingAfterTieBreak;
    }

    public static State InitialState(int serving)
    {
        return new State(DateTime.Now, new Score((0,0),(0,0),(0,0)), serving);
    }
}
