using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Newtonsoft.Json;

namespace Matches.Application.DTOs;

/// <summary>
/// Data Transfer Object for describing a completed match with the summary included.
/// </summary>
public sealed class MatchWithSummary : Match
{
    /// <summary>
    /// The summary of a completed match.
    /// </summary>
    /// <value>The summary of a completed match.</value>
    [Required]
    [DataMember(Name="summary", EmitDefaultValue=false)]
    public MatchSummary Summary { get; set; } = new MatchSummary();

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class MatchWithSummary {\n");
        sb.Append("  Id: ").Append(Id).Append("\n");
        sb.Append("  CreatedAt: ").Append(CreatedAt).Append("\n");
        sb.Append("  Configuration: ").Append(Format).Append("\n");
        sb.Append("  Summary: ").Append(Summary).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }

    /// <summary>
    /// Returns the JSON string presentation of the object
    /// </summary>
    /// <returns>JSON string presentation of the object</returns>
    public new string ToJson()
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(this, Newtonsoft.Json.Formatting.Indented);
    }
}