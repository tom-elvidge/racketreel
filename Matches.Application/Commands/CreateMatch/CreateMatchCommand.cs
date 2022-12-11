using System.Text;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Commands.CreateMatch;

/// <summary>
/// Command for creating a new match.
/// </summary>
public sealed class CreateMatchCommand : ICommand<Match>
{
    /// <summary>
    /// The list of players participating in this match.
    /// </summary>
    public List<string> Players { get; set; } = new List<string>();

    /// <summary>
    /// The player who is serving first.
    /// </summary>
    public string ServingFirst { get; set; } = string.Empty;

    /// <summary>
    /// The maximum number of sets which can be played in this match.
    /// </summary>
    public SetsEnum Sets { get; set; }

    /// <summary>
    /// The advantage rule is not played at deuce, so if you win on deuce then you win the game.
    /// </summary>
    public bool SuddenDeathDeuce { get; set; }

    /// <summary>
    /// The minimum number of games needed to win a set.
    /// </summary>
    public GamesEnum Games { get; set; }

    /// <summary>
    /// Optionally override the number of games only for the final set. Do not change if omitted.
    /// </summary>
    public GamesEnum? GamesFinalSet { get; set; }

    /// <summary>
    /// A player must have a game advantage before they can win a set.
    /// </summary>
    public bool GameAdvantage { get; set; }

    /// <summary>
    /// Optionally override the game advantage rule for the final set. Do not change if omitted.
    /// </summary>
    public bool? GameAdvantageFinalSet { get; set; }

    /// <summary>
    /// The rule to use when scoring tiebreaks.
    /// </summary>
    public TiebreakRuleEnum TiebreakRule { get; set; }

    /// <summary>
    /// Optionally override the tiebreak rule only for the final set. Do not change if omitted.
    /// </summary>
    public TiebreakRuleEnum? TiebreakRuleFinalSet { get; set; }

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class CreateMatchCommand {\n");
        sb.Append("  Players: ").Append(Players).Append("\n");
        sb.Append("  ServingFirst: ").Append(ServingFirst).Append("\n");
        sb.Append("  Sets: ").Append(Sets).Append("\n");
        sb.Append("  SuddenDeathDeuce: ").Append(SuddenDeathDeuce).Append("\n");
        sb.Append("  Games: ").Append(Games).Append("\n");
        sb.Append("  GamesFinalSet: ").Append(GamesFinalSet).Append("\n");
        sb.Append("  GameAdvantage: ").Append(GameAdvantage).Append("\n");
        sb.Append("  TiebreakRule: ").Append(TiebreakRule).Append("\n");
        sb.Append("  TiebreakRuleFinalSet: ").Append(TiebreakRuleFinalSet).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }

    /// <summary>
    /// Returns the JSON string presentation of the object
    /// </summary>
    /// <returns>JSON string presentation of the object</returns>
    public string ToJson()
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(this, Newtonsoft.Json.Formatting.Indented);
    }
}