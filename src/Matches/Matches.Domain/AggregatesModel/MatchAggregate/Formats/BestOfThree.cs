namespace Matches.Domain.AggregatesModel.MatchAggregate.Formats;

public sealed class BestOfThree
{
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
            TiebreakRuleEnum.TenPointTiebreaker);
    }
}