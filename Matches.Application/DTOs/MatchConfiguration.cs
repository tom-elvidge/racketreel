using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Newtonsoft.Json;

namespace Matches.Application.DTOs;

/// <summary>
/// Data Transfer Object for describing the configuration of a match.
/// </summary>
[DataContract]
public sealed class MatchConfiguration
{
    /// <summary>
    /// The list of players participating in this match.
    /// </summary>
    /// <value>The list of players participating in this match.</value>
    [Required]
    [DataMember(Name="players", EmitDefaultValue=false)]
    public List<string> Players { get; set; } = new List<string>();

    /// <summary>
    /// The player who is serving first.
    /// </summary>
    /// <value>The player who is serving first.</value>
    [Required]
    [DataMember(Name="servingFirst", EmitDefaultValue=false)]
    public string ServingFirst { get; set; } = string.Empty;


    /// <summary>
    /// The maximum number of sets which can be played in this match.
    /// </summary>
    /// <value>The maximum number of sets which can be played in this match.</value>

    /// <summary>
    /// The maximum number of sets which can be played in this match.
    /// </summary>
    /// <value>The maximum number of sets which can be played in this match.</value>
    [Required]
    [DataMember(Name="sets", EmitDefaultValue=true)]
    public SetsEnum Sets { get; set; }


    /// <summary>
    /// The minimum number of games needed to win a set.
    /// </summary>
    /// <value>The minimum number of games needed to win a set.</value>

    /// <summary>
    /// The minimum number of games needed to win a set.
    /// </summary>
    /// <value>The minimum number of games needed to win a set.</value>
    [Required]
    [DataMember(Name="games", EmitDefaultValue=true)]
    public GamesEnum Games { get; set; }


    /// <summary>
    /// The minimum number of points needed to win a tiebreak. If omitted then a game advantage is required to win the set.
    /// </summary>
    /// <value>The minimum number of points needed to win a tiebreak. If omitted then a game advantage is required to win the set.</value>
    
    public enum TiebreakEnum
    {
        
        /// <summary>
        /// Enum _7Enum for 7
        /// </summary>
        
        _7Enum = 7,
        
        /// <summary>
        /// Enum _12Enum for 12
        /// </summary>
        
        _12Enum = 12
    }

    /// <summary>
    /// The minimum number of points needed to win a tiebreak. If omitted then a game advantage is required to win the set.
    /// </summary>
    /// <value>The minimum number of points needed to win a tiebreak. If omitted then a game advantage is required to win the set.</value>
    [DataMember(Name="tiebreak", EmitDefaultValue=true)]
    public TiebreakEnum? Tiebreak { get; set; }

    /// <summary>
    /// The advantage rule is not played at deuce, so if you win on deuce then you win the game.
    /// </summary>
    /// <value>The advantage rule is not played at deuce, so if you win on deuce then you win the game.</value>
    [Required]
    [DataMember(Name="suddenDeathDeuce", EmitDefaultValue=true)]
    public bool SuddenDeathDeuce { get; set; }

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class CreateMatchRequest {\n");
        sb.Append("  Players: ").Append(Players).Append("\n");
        sb.Append("  ServingFirst: ").Append(ServingFirst).Append("\n");
        sb.Append("  Sets: ").Append(Sets).Append("\n");
        sb.Append("  Games: ").Append(Games).Append("\n");
        sb.Append("  Tiebreak: ").Append(Tiebreak).Append("\n");
        sb.Append("  SuddenDeathDeuce: ").Append(SuddenDeathDeuce).Append("\n");
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