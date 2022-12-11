namespace Matches.Application.DTOs;

/// <summary>
/// The rule to use for tiebreaks.
/// </summary>
public enum MatchConfiguration
{
    /// <summary>
    /// Tiebreak to 10 points
    /// </summary>
    TiebreakToTen = 0,

    /// <summary>
    /// Best of 3 sets with a 10 point tiebreaker played when a set reaches 6-6
    /// </summary>
    BestOfThreeSevenPointTiebreaker = 1,
    
    /// <summary>
    /// Best of 5 sets with a 10 point tiebreaker played when a set reaches 6-6
    /// </summary>
    BestOfFiveSevenPointTiebreaker = 2,

    /// <summary>
    /// FAST4TENNIS
    /// https://www4.lta.org.uk/globalassets/competitions/rules-and-regulations/fast4-scoring-format--rules-january-2021-v3.pdf
    /// </summary>
    FastFour = 3,
}