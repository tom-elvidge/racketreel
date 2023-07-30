using System.Text;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;

namespace RacketReel.Application.Commands.AddPoint;

public sealed class AddPointCommand : ICommand
{
    public int MatchId { get; set; }
    public Team Team { get; set; }

    public AddPointCommand(int matchId, Team team)
    {
        MatchId = matchId;
        Team = team;
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class CreateStateCommand {\n");
        sb.Append("  MatchId: ").Append(MatchId).Append('\n');
        sb.Append("  Team: ").Append(Team).Append($"\n");
        sb.Append("}\n");
        return sb.ToString();
    }
}