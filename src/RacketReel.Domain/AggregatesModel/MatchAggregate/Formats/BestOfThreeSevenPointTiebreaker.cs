using RacketReel.Domain.AggregatesModel.MatchAggregate.Formats;

public sealed class BestOfThreeSevenPointTiebreaker
{
    /// <summary>
    /// Return the configuration for best of three sets match with a seven point tiebreaker for every set.
    /// </summary>
    public static Format Create()
    {
        return new Format(
            SetsEnum._3Enum,
            false,
            GamesEnum._6Enum,
            true,
            TiebreakRuleEnum.SevenPointTiebreaker,
            null,
            null,
            null);
    }
}