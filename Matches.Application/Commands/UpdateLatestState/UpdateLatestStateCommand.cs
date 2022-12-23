using System.Text;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Commands.UpdateLatestState;

public sealed class UpdateLatestStateCommand : ICommand<State>
{
    public int MatchId { get; set; }

    public bool Highlight { get; set; }

    public UpdateLatestStateCommand(int matchId, bool highlight)
    {
        MatchId = matchId;
        Highlight = highlight;
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class UpdateLatestStateCommand {\n");
        sb.Append("  MatchId: ").Append(MatchId).Append("\n");
        sb.Append("  Highlight: ").Append(Highlight).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }
}