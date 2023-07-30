namespace RacketReel.Domain.AggregatesModel.MatchAggregate.Formats;

public sealed class BestOfOne
{
    public static Format Create()
    {
        return new Format(
            SetsEnum._1Enum,
            false,
            GamesEnum._6Enum,
            true,
            TiebreakRuleEnum.SevenPointTiebreaker,
            null,
            null,
            TiebreakRuleEnum.TenPointTiebreaker);
    }
}