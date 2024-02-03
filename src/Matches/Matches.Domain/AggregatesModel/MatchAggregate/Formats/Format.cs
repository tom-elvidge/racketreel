using System.Text;
using Matches.Domain.SeedWork;

namespace Matches.Domain.AggregatesModel.MatchAggregate.Formats;

/// <summary>
/// Describes the rules for scoring a match.
/// </summary>
public sealed class Format : ValueObject
{
    /// <summary>
    /// The maximum number of sets which can be played in this match.
    /// </summary>
    public SetsEnum Sets { get; private set; }

    /// <summary>
    /// The advantage rule is not played at deuce, so if you win on deuce then you win the game.
    /// </summary>
    public bool SuddenDeathDeuce { get; private set; }

    /// <summary>
    /// The minimum number of games needed to win a set.
    /// </summary>
    public GamesEnum Games { get; private set; }

    /// <summary>
    /// The number of games for the final set.
    /// </summary>
    public GamesEnum GamesFinalSet => _gamesFinalSet ?? Games;

    private GamesEnum? _gamesFinalSet { get; set; }

    /// <summary>
    /// A player must have a game advantage before they can win a set.
    /// </summary>
    public bool GameAdvantage { get; private set; }

    /// <summary>
    /// Use the game advantage rule for the final set.
    /// </summary>
    public bool GameAdvantageFinalSet => _gameAdvantageFinalSet ?? GameAdvantage;

    private bool? _gameAdvantageFinalSet { get; set; }

    /// <summary>
    /// The rule to use when scoring tiebreaks.
    /// </summary>
    public TiebreakRuleEnum TiebreakRule { get; private set; }

    /// <summary>
    /// The tiebreak rule for the final set.
    /// </summary>
    public TiebreakRuleEnum TiebreakRuleFinalSet => _tiebreakRuleFinalSet ?? TiebreakRule;

    private TiebreakRuleEnum? _tiebreakRuleFinalSet { get; set; }

    public Format(
        SetsEnum sets,
        bool suddenDeathDeuce,
        GamesEnum games,
        bool gameAdvantage,
        TiebreakRuleEnum tiebreakRule,
        GamesEnum? gamesFinalSet,
        bool? gameAdvantageFinalSet,
        TiebreakRuleEnum? tiebreakRuleFinalSet)
    {
        Sets = sets;
        SuddenDeathDeuce = suddenDeathDeuce;
        Games = games;
        GameAdvantage = gameAdvantage;
        TiebreakRule = tiebreakRule;
        _gamesFinalSet = gamesFinalSet;
        _gameAdvantageFinalSet = gameAdvantageFinalSet;
        _tiebreakRuleFinalSet = tiebreakRuleFinalSet;
    }

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
}