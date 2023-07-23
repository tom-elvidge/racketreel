using System.Text;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.DTOs;

namespace RacketReel.Application.Commands.CreateMatch;

/// <summary>
/// Command for creating a new match.
/// </summary>
public sealed class CreateMatchCommand : ICommand<Match>
{
    /// <summary>
    /// The list of the participants of this match.
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

    public CreateMatchCommand(
        List<string> participants,
        string servingFirst,
        MatchFormatEnum format)
    {
        Participants = participants;
        ServingFirst = servingFirst;
        Format = format;
    }

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class CreateMatchCommand {\n");
        sb.Append("  Players: ").Append(Participants).Append("\n");
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