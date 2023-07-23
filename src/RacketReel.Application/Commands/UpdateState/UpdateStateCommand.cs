using System.Text;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.DTOs;

namespace RacketReel.Application.Commands.UpdateState;

public sealed class UpdateStateCommand : ICommand<State>
{
    public int MatchId { get; set; }

    public int StateIndex { get; set; }

    public bool Highlight { get; set; }

    public UpdateStateCommand(int matchId, int stateIndex, bool highlight)
    {
        MatchId = matchId;
        StateIndex = stateIndex;
        Highlight = highlight;
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class UpdateStateCommand {\n");
        sb.Append("  MatchId: ").Append(MatchId).Append("\n");
        sb.Append("  StateIndex: ").Append(StateIndex).Append("\n");
        sb.Append("  Highlight: ").Append(Highlight).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }
}