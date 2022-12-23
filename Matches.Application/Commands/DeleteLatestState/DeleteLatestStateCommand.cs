using System.Text;
using Matches.Application.Abstractions.Messaging;

namespace Matches.Application.Commands.DeleteLatestState;

public sealed class DeleteLatestStateCommand : ICommand
{
    public int MatchId { get; set; }


    public DeleteLatestStateCommand(int matchId)
    {
        MatchId = matchId;
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class DeleteLatestStateCommand {\n");
        sb.Append("  MatchId: ").Append(MatchId).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }
}