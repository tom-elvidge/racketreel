using System.Text;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Commands.CreateMatch;

/// <summary>
/// Command for creating a new match.
/// </summary>
public sealed class CreateMatchCommand : ICommand<MatchDTO>
{
    /// <summary>
    /// The list of players participating in this match.
    /// </summary>
    public List<string> Players { get; set; } = new List<string>();

    /// <summary>
    /// The player who is serving first.
    /// </summary>
    public string ServingFirst { get; set; } = string.Empty;

    /// <summary>
    /// The format to use for scoring this match.
    /// </summary>
    public MatchFormatEnum Format { get; set; }

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class CreateMatchCommand {\n");
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