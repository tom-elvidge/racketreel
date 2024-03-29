using System.Text;
using Matches.Application.Models;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.Models.Match;

namespace Matches.Application.Commands.AddPoint;

public sealed class AddPointCommand : ICommand
{
    public string UserId { get; set; }
    public int MatchId { get; set; }
    public Team Team { get; set; }

    public AddPointCommand(string userId, int matchId, Team team)
    {
        UserId = userId;
        MatchId = matchId;
        Team = team;
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class CreateStateCommand {\n");
        sb.Append("  UserId: ").Append(UserId).Append('\n');
        sb.Append("  MatchId: ").Append(MatchId).Append('\n');
        sb.Append("  Team: ").Append(Team).Append($"\n");
        sb.Append("}\n");
        return sb.ToString();
    }
}