namespace Matches.Domain.AggregatesModel.MatchAggregate.Formats;

public sealed class BestOfThreeFinalSetTiebreak
{
    public static Format Create()
    {
        return new Format(
            SetsEnum._3Enum,
            false,
            GamesEnum._6Enum,
            true,
            TiebreakRuleEnum.SevenPointTiebreaker,
            GamesEnum._1Enum,
            null,
            TiebreakRuleEnum.TenPointTiebreaker);
    }
}