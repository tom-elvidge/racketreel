using System.Text;

namespace Matches.Application.RequestBodies;

/// <summary>
/// The body for HTTP requests to create a new state in a match.
/// </summary>
public sealed class CreateStateRequestBody
{
    /// <summary>
    /// The participant who has scored a point.
    /// </summary>
    /// <value>The participant who has scored a point.</value>
    public string Participant { get; set; } = string.Empty;

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class CreateStateRequestBody {\n");
        sb.Append("  Participant: ").Append(Participant).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }

    public string ToJson()
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(this, Newtonsoft.Json.Formatting.Indented);
    }
}