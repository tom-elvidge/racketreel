using System.Text;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;

namespace Matches.Application.Commands.CreateState;

public sealed class CreateStateCommand : ICommand<Tuple<State, int>>
{
    public int MatchId { get; set; }

    public string Participant { get; set; } = string.Empty;

    public CreateStateCommand(int matchId, string participant)
    {
        MatchId = matchId;
        Participant = participant;
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class CreateStateCommand {\n");
        sb.Append("  MatchId: ").Append(MatchId).Append("\n");
        sb.Append("  Participant: ").Append(Participant).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }
}