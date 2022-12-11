namespace Matches.Domain.AggregatesModel.MatchAggregate.Configuration;

/// <summary>
/// The rule to use for tiebreaks.
/// </summary>
public enum TiebreakRuleEnum
{
    /// <summary>
    /// No tiebreak is played.
    /// </summary>
    None = 0,

    /// <summary>
    /// Tiebreak to 7 points or officially a USTA 12 point tiebreak.
    /// </summary>
    SevenPointTiebreaker = 1,
    
    /// <summary>
    /// Tiebreak to 10 points.
    /// </summary>
    TenPointTiebreaker = 2
}