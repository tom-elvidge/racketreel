namespace RacketReel.Application.Models;

public enum Format
{
    /// <summary>
    /// Tiebreak to 10 points
    /// </summary>
    TiebreakToTen = 0,
    
    /// <summary>
    /// Best of 3 sets with a 10 point tiebreaker if the set reaches 6-6
    /// </summary>
    BestOfOne = 1,

    /// <summary>
    /// Best of 3 sets with a 7 point tiebreaker if a set reaches 6-6 and a 10 point tiebreaker if the final set reaches
    /// 6-6
    /// </summary>
    BestOfThree = 2,
    
    /// <summary>
    /// Best of 5 sets with a 7 point tiebreaker if a set reaches 6-6 and a 10 point tiebreaker if the final set reaches
    /// 6-6
    /// </summary>
    BestOfFive = 3,
    
    /// <summary>
    /// Best of 3 sets with a 7 point tiebreaker if a set reaches 6-6 and a 10 point tiebreaker in lieu of a final set
    /// </summary>
    BestOfThreeFinalSetTiebreak = 4,
    
    /// <summary>
    /// Best of 5 sets with a 7 point tiebreaker if a set reaches 6-6 and a 10 point tiebreaker in lieu of a final set
    /// </summary>
    BestOfFiveFinalSetTiebreak = 5,

    /// <summary>
    /// FAST4TENNIS
    /// https://www4.lta.org.uk/globalassets/competitions/rules-and-regulations/fast4-scoring-format--rules-january-2021-v3.pdf
    /// </summary>
    FastFour = 6
}