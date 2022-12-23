using System.Text;

namespace Matches.Application.RequestBodies;

/// <summary>
/// The body for HTTP requests to update a state in a match.
/// </summary>
public sealed class UpdateStateRequestBody
{
    /// <summary>
    /// A flag to mark the time from the previous state until this state as a highlight.
    /// </summary>
    /// <value>A flag to mark the time from the previous state until this state as a highlight.</value>
    public bool Highlight { get; set; }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class UpdateStateRequestBody {\n");
        sb.Append("  Highlight: ").Append(Highlight).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }

    public string ToJson()
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(this, Newtonsoft.Json.Formatting.Indented);
    }
}