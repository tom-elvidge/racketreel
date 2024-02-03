using System.Text;
using Matches.Application.Abstractions.Messaging;

namespace Matches.Application.Commands.UndoPoint;

public sealed class UndoPointCommand : ICommand
{
    public string UserId { get; set; }
    
    public int MatchId { get; set; }
    
    public UndoPointCommand(string userId, int matchId)
    {
        UserId = userId;
        MatchId = matchId;
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class UndoPointCommand {\n");
        sb.Append("  UserId: ").Append(MatchId).Append("\n");
        sb.Append("  MatchId: ").Append(MatchId).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }
}