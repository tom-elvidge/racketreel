namespace RacketReel.Domain.AggregatesModel.MatchAggregate.Formats;

public sealed class TiebreakToTen
{
    /// <summary>
    /// Return the configuration needed for a single tiebreak to ten.
    /// </summary>
    public static Format Create()
    {
        return new Format(
            SetsEnum._1Enum,
            false,
            GamesEnum._1Enum,
            false,
            TiebreakRuleEnum.TenPointTiebreaker,
            null,
            null,
            null);
    }
}