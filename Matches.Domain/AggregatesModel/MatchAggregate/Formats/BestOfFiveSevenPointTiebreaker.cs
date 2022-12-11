using Matches.Domain.AggregatesModel.MatchAggregate.Formats;

public sealed class BestOfFiveSevenPointTiebreaker
{
    /// <summary>
    /// Return the configuration for best of five sets match with a seven point tiebreaker for every set.
    /// </summary>
    public static Format Create()
    {
        return new Format(
            SetsEnum._5Enum,
            false,
            GamesEnum._6Enum,
            true,
            TiebreakRuleEnum.SevenPointTiebreaker,
            null,
            null,
            null
        );
    }
}