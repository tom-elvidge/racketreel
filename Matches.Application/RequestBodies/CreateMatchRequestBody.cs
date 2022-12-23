using System.Text;
using Matches.Application.DTOs;

namespace Matches.Application.Commands.CreateMatch;

/// <summary>
/// The body for HTTP requests to create a new match.
/// </summary>
public sealed class CreateMatchRequestBody
{
    /// <summary>
    /// The list of participants of this match.
    /// </summary>
    public List<string> Participants { get; set; } = new List<string>();

    /// <summary>
    /// The player who is serving first.
    /// </summary>
    public string ServingFirst { get; set; } = string.Empty;

    /// <summary>
    /// The format to use for scoring this match.
    /// </summary>
    public MatchFormatEnum Format { get; set; }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class CreateMatchRequestBody {\n");
        sb.Append("  Players: ").Append(Participants).Append("\n");
        sb.Append("  ServingFirst: ").Append(ServingFirst).Append("\n");
        sb.Append("  Format: ").Append(Format).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }

    public string ToJson()
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(this, Newtonsoft.Json.Formatting.Indented);
    }
}