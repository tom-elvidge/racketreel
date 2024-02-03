namespace Matches.Domain.AggregatesModel.MatchAggregate.Formats;

public sealed class FastFour
{
    /// <summary>
    /// Return the configuration for a fast four match.
    /// https://www4.lta.org.uk/globalassets/competitions/rules-and-regulations/fast4-scoring-format--rules-january-2021-v3.pdf
    /// </summary>
    public static Format Create()
    {
        // No game advantage needed but a tiebreak can still be played.
        // First to 4 but if it reaches 3-3 then play the tiebreak.
        // If a game advantage was required then the tiebreak would be played at 4-4.
        return new Format(
            SetsEnum._3Enum,
            true,
            GamesEnum._4Enum,
            false,
            TiebreakRuleEnum.SevenPointTiebreaker,
            GamesEnum._1Enum,
            null,
            TiebreakRuleEnum.TenPointTiebreaker
        );
    }
}