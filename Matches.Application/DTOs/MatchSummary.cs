using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Newtonsoft.Json;

namespace Matches.Application.DTOs;

/// <summary>
/// Data Transfer Object for describing the summary of a completed match.
/// </summary>
[DataContract]
public sealed class MatchSummary
{
    /// <summary>
    /// The date and time at which this match was completed. String formatted as an ISO 8601 date and time in UTC.
    /// </summary>
    /// <value>The date and time at which this match was completed. String formatted as an ISO 8601 date and time in UTC.</value>
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
    /// The summary of the score for each set. Represented as a mapping from the set index (0, 1, 2, etc) to the summary of that set.
    /// </summary>
    /// <value>The summary of the score for each set. Represented as a mapping from the set index (0, 1, 2, etc) to the summary of that set.</value>
    [Required]
    [DataMember(Name="sets", EmitDefaultValue=false)]
    public Dictionary<string, SetSummary> Sets { get; set; } = new Dictionary<string, SetSummary>();

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class MatchSummary {\n");
        sb.Append("  CompletedAt: ").Append(CompletedAt).Append("\n");
        sb.Append("  Winner: ").Append(Winner).Append("\n");
        sb.Append("  Sets: ").Append(Sets).Append("\n");
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