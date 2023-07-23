using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Newtonsoft.Json;

namespace RacketReel.Application.DTOs;

/// <summary>
/// Data Transfer Object for describing the summary of a set for a completed match.
/// </summary>
[DataContract]
public class SetSummary
{
    /// <summary>
    /// The date and time at which this set was completed. String formatted as an ISO 8601 date and time in UTC.
    /// </summary>
    /// <value>The date and time at which this set was completed. String formatted as an ISO 8601 date and time in UTC.</value>
    [Required]
    [DataMember(Name="completedAt", EmitDefaultValue=false)]
    public string CompletedAt { get; set; } = string.Empty;

    /// <summary>
    /// The name of the player which won the set.
    /// </summary>
    /// <value>The name of the player which won the set.</value>
    [Required]
    [DataMember(Name="winner", EmitDefaultValue=false)]
    public string Winner { get; set; } = string.Empty;

    /// <summary>
    /// A boolean flag to indicate this set went to a tiebreak.
    /// </summary>
    /// <value>A boolean flag to indicate this set went to a tiebreak.</value>
    [Required]
    [DataMember(Name="tiebreak", EmitDefaultValue=true)]
    public bool Tiebreak { get; set; }

    /// <summary>
    /// The summary of the score of the set for each player. Represented as a mapping from the name of each player to the summary for that player.
    /// </summary>
    /// <value>The summary of the score of the set for each player. Represented as a mapping from the name of each player to the summary for that player.</value>
    [Required]
    [DataMember(Name="score", EmitDefaultValue=false)]
    public Dictionary<string, ParticipantSetSummary> Score { get; set; } = new Dictionary<string, ParticipantSetSummary>();

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class SetSummary {\n");
        sb.Append("  CompletedAt: ").Append(CompletedAt).Append("\n");
        sb.Append("  Winner: ").Append(Winner).Append("\n");
        sb.Append("  Tiebreak: ").Append(Tiebreak).Append("\n");
        sb.Append("  Score: ").Append(Score).Append("\n");
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