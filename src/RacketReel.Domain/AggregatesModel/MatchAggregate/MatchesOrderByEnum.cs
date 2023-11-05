namespace RacketReel.Domain.AggregatesModel.MatchAggregate;

/// <summary>
/// Enumeration of valid values for ordering matches in a collection of matches.
/// </summary>
public enum MatchesOrderByEnum
{
    /// <summary>
    /// Enum CreatedAt for 0. Order by the created date and time from oldest to newest.
    /// </summary>
    CreatedAt = 0,
    
    /// <summary>
    /// Enum CompletedAt for 1. Order by the completed date and time from oldest to newest. Do not include matches which have not been completed.
    /// </summary>
    CompletedAt = 1
}