using System.Text;
using System.Runtime.Serialization;

namespace Matches.Application.DTOs;

/// <summary>
/// Data Transfer Object for describing a message.
/// </summary>
[DataContract]
public class Message
{
    /// <summary>
    /// Gets or Sets _Message
    /// </summary>
    [DataMember(Name="message", EmitDefaultValue=false)]
    public string _Message { get; set; } = string.Empty;

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class Message {\n");
        sb.Append("  _Message: ").Append(_Message).Append("\n");
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