using System.Text;
using Matches.Application.Abstractions.Messaging;

namespace Matches.Application.Commands.ToggleHighlight;

public sealed class ToggleHighlightCommand : ICommand
{
    public string UserId { get; set; }
    public int MatchId { get; set; }
    public int? Version { get; set; }

    public ToggleHighlightCommand(string userId, int matchId, int version)
    {
        UserId = userId;
        MatchId = matchId;
        Version = version;
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class UpdateLatestStateCommand {\n");
        sb.Append("  UserId: ").Append(UserId).Append('\n');
        sb.Append("  MatchId: ").Append(MatchId).Append('\n');
        sb.Append("  Version: ").Append(Version).Append('\n');
        sb.Append("}\n");
        return sb.ToString();
    }
}