using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Newtonsoft.Json;

namespace Matches.Application.DTOs;

/// <summary>
/// Data Transfer Object for describing a match.
/// </summary>
[DataContract]
public class MatchDTO
{
    /// <summary>
    /// A unique identifier for this match.
    /// </summary>
    /// <value>A unique identifier for this match.</value>
    [Required]
    [DataMember(Name="id", EmitDefaultValue=true)]
    public int Id { get; set; }

    /// <summary>
    /// The date and time at which this match was created. String formatted as an ISO 8601 date and time in UTC.
    /// </summary>
    /// <value>The date and time at which this match was created. String formatted as an ISO 8601 date and time in UTC.</value>
    [Required]
    [DataMember(Name="createdAt", EmitDefaultValue=false)]
    public string CreatedAt { get; set; } = string.Empty;

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
    /// The format of the match. This controls the participants, rules and scoring.
    /// </summary>
    /// <value>The format of the match. This controls the participants, rules and scoring.</value>
    [Required]
    [DataMember(Name="format", EmitDefaultValue=false)]
    [JsonProperty]
    public MatchFormatEnum Format { get; set; }

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class Match {\n");
        sb.Append("  Id: ").Append(Id).Append("\n");
        sb.Append("  CreatedAt: ").Append(CreatedAt).Append("\n");
        sb.Append("  Players: ").Append(Players).Append("\n");
        sb.Append("  ServingFirst: ").Append(ServingFirst).Append("\n");
        sb.Append("  Format: ").Append(Format).Append("\n");
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