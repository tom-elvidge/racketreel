namespace RacketReel.Domain.AggregatesModel.MatchAggregate.Formats;

public sealed class BestOfFiveFinalSetTiebreak
{
    public static Format Create()
    {
        return new Format(
            SetsEnum._5Enum,
            false,
            GamesEnum._6Enum,
            true,
            TiebreakRuleEnum.SevenPointTiebreaker,
            GamesEnum._1Enum,
            null,
            TiebreakRuleEnum.TenPointTiebreaker);
    }
}