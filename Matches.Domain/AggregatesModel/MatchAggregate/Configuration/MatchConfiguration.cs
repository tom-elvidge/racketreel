using System.Text;
using Matches.Domain.SeedWork;

namespace Matches.Domain.AggregatesModel.MatchAggregate.Configuration;

/// <summary>
/// Describes the rules for scoring a tennis match.
/// </summary>
public sealed class MatchConfiguration : ValueObject
{
    /// <summary>
    /// The maximum number of sets which can be played in this match.
    /// </summary>
    public SetsEnum Sets { get; init; }

    /// <summary>
    /// The advantage rule is not played at deuce, so if you win on deuce then you win the game.
    /// </summary>
    public bool SuddenDeathDeuce { get; init; }

    /// <summary>
    /// The minimum number of games needed to win a set.
    /// </summary>
    public GamesEnum Games { get; init; }

    /// <summary>
    /// Optionally override the number of games only for the final set. Do not change if omitted.
    /// </summary>
    public GamesEnum? GamesFinalSet { get; init; }

    /// <summary>
    /// A player must have a game advantage before they can win a set.
    /// </summary>
    public bool GameAdvantage { get; init; }

    /// <summary>
    /// Optionally override the game advantage rule for the final set. Do not change if omitted.
    /// </summary>
    public bool? GameAdvantageFinalSet { get; init; }

    /// <summary>
    /// The rule to use when scoring tiebreaks.
    /// </summary>
    public TiebreakRuleEnum TiebreakRule { get; init; }

    /// <summary>
    /// Optionally override the tiebreak rule only for the final set. Do not change if omitted.
    /// </summary>
    public TiebreakRuleEnum? TiebreakRuleFinalSet { get; init; }

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class CreateMatchRequest {\n");
        sb.Append("  Sets: ").Append(Sets).Append("\n");
        sb.Append("  SuddenDeathDeuce: ").Append(SuddenDeathDeuce).Append("\n");
        sb.Append("  Games: ").Append(Games).Append("\n");
        sb.Append("  GamesFinalSet: ").Append(GamesFinalSet).Append("\n");
        sb.Append("  GameAdvantage: ").Append(GameAdvantage).Append("\n");
        sb.Append("  GameAdvantageFinalSet: ").Append(GameAdvantageFinalSet).Append("\n");
        sb.Append("  TiebreakRule: ").Append(TiebreakRule).Append("\n");
        sb.Append("  TiebreakRuleFinalSet: ").Append(TiebreakRuleFinalSet).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }
    
    /// <summary>
    /// Returns the components which determine equality.
    /// </summary>
    protected override IEnumerable<object> GetEqualityComponents()
    {
        yield return Sets;
        yield return SuddenDeathDeuce;
        yield return Games;
        yield return GamesFinalSet;
        yield return GameAdvantage;
        yield return GameAdvantageFinalSet;
        yield return TiebreakRule;
        yield return TiebreakRuleFinalSet;
    }

    /// <summary>
    /// Return the configuration needed for a single tiebreak to ten.
    /// </summary>
    public static MatchConfiguration TiebreakToTen()
    {
        return new MatchConfiguration
        {
            Sets = SetsEnum._1Enum,
            SuddenDeathDeuce = false,
            Games = GamesEnum._1Enum,
            GamesFinalSet = null,
            GameAdvantage = false,
            GameAdvantageFinalSet = null,
            TiebreakRule = TiebreakRuleEnum.TenPointTiebreaker,
            TiebreakRuleFinalSet = null,
        };
    }

    /// <summary>
    /// Return the configuration for best of three sets match with a seven point tiebreaker for every set.
    /// </summary>
    public static MatchConfiguration BestOfThreeSevenPointTiebreaker()
    {
        return new MatchConfiguration
        {
            Sets = SetsEnum._3Enum,
            SuddenDeathDeuce = false,
            Games = GamesEnum._6Enum,
            GamesFinalSet = null,
            GameAdvantage = true,
            GameAdvantageFinalSet = null,
            TiebreakRule = TiebreakRuleEnum.SevenPointTiebreaker,
            TiebreakRuleFinalSet = null,
        };
    }

    /// <summary>
    /// Return the configuration for best of five sets match with a seven point tiebreaker for every set.
    /// </summary>
    public static MatchConfiguration BestOfFiveSevenPointTiebreaker()
    {
        return new MatchConfiguration
        {
            Sets = SetsEnum._5Enum,
            SuddenDeathDeuce = false,
            Games = GamesEnum._6Enum,
            GamesFinalSet = null,
            GameAdvantage = true,
            GameAdvantageFinalSet = null,
            TiebreakRule = TiebreakRuleEnum.SevenPointTiebreaker,
            TiebreakRuleFinalSet = null,
        };
    }

    /// <summary>
    /// Return the configuration for a fast four match.
    /// https://www4.lta.org.uk/globalassets/competitions/rules-and-regulations/fast4-scoring-format--rules-january-2021-v3.pdf
    /// </summary>
    public static MatchConfiguration FastFour()
    {
        // No game advantage needed but a tiebreak can still be played.
        // First to 4 but if it reaches 3-3 then play the tiebreak.
        // If a game advantage was required then the tiebreak would be played at 4-4.
        return new MatchConfiguration
        {
            Sets = SetsEnum._3Enum,
            SuddenDeathDeuce = true,
            Games = GamesEnum._4Enum,
            GamesFinalSet = GamesEnum._1Enum,
            GameAdvantage = false,
            GameAdvantageFinalSet = null,
            TiebreakRule = TiebreakRuleEnum.SevenPointTiebreaker,
            TiebreakRuleFinalSet = TiebreakRuleEnum.TenPointTiebreaker,
        };
    }
}