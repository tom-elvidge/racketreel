using System.Text;
using RacketReel.Application.Abstractions.Messaging;

namespace RacketReel.Application.Commands.ToggleHighlight;

public sealed class ToggleHighlightCommand : ICommand
{
    public int MatchId { get; set; }
    public int? Version { get; set; }

    public ToggleHighlightCommand(int matchId, int version)
    {
        MatchId = matchId;
        Version = version;
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class UpdateLatestStateCommand {\n");
        sb.Append("  MatchId: ").Append(MatchId).Append('\n');
        sb.Append("  Version: ").Append(Version).Append('\n');
        sb.Append("}\n");
        return sb.ToString();
    }
}