using System.Text;
using System.Runtime.Serialization;

namespace Matches.Application.DTOs;

/// <summary>
/// Data Transfer Object for describing multiple messages.
/// </summary>
[DataContract]
public class Messages
{
    /// <summary>
    /// Gets or Sets _Messages
    /// </summary>
    [DataMember(Name="messages", EmitDefaultValue=false)]
    public List<string> _Messages { get; set; } = new List<string>();

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class Messages {\n");
        sb.Append("  _Messages: ").Append(_Messages).Append("\n");
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