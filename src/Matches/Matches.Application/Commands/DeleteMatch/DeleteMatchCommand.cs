using System.Text;
using Matches.Application.Abstractions.Messaging;

namespace Matches.Application.Commands.DeleteMatch;

public sealed class DeleteMatchCommand : ICommand
{
    public string UserId { get; set; }
    public int MatchId { get; set; }

    public DeleteMatchCommand(string userId, int matchId)
    {
        UserId = userId;
        MatchId = matchId;
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class DeleteMatchCommand {\n");
        sb.Append("  UserId: ").Append(UserId).Append('\n');
        sb.Append("  MatchId: ").Append(MatchId).Append('\n');
        sb.Append("}\n");
        return sb.ToString();
    }
}