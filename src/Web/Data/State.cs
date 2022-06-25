namespace RacketReel.Web.Data;

#nullable enable

public class State
{
    public DateTime CreatedDateTime { get; private set; }
    public string Serving { get; private set; }
    public IDictionary<string, PlayerScore> Score { get; private set; }
    public bool IsTieBreak { get; private set; }

    // Optional tie break fields
    public int? TieBreakPointCounter { get; private set; }
    public string? ServingAfterTieBreak { get; private set; }

    public State(DateTime createdDateTime, string serving, IDictionary<string, PlayerScore> score, bool isTieBreak, int? tieBreakPointCounter, string? servingAfterTieBreak)
    {
        CreatedDateTime = createdDateTime;
        Serving = serving;
        Score = score;
        IsTieBreak = isTieBreak;
        TieBreakPointCounter = tieBreakPointCounter;
        ServingAfterTieBreak = servingAfterTieBreak;
    }
}
