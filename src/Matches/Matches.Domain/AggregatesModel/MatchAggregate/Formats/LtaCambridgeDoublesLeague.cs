namespace Matches.Domain.AggregatesModel.MatchAggregate.Formats;

public sealed class LtaCambridgeDoublesLeague
{
    /// <summary>
    /// Return the configuration for LTA Cambridge Dunlop leagues
    /// </summary>
    public static Format Create()
    {
        return new Format(
            SetsEnum._2Enum,
            false,
            GamesEnum._6Enum,
            true,
            TiebreakRuleEnum.SevenPointTiebreaker,
            // final set will be the second set which is just a normal set so use the same rules
            null,
            null,
            null
        );
    }
}