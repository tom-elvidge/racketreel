using System.Text.Json;
using MediatR;

namespace RacketReel.Services.Matches.API.Application.Commands.DeleteLatestMatchState;

public class DeleteLatestMatchStateCommand : IRequest<Unit>
{
    public int MatchId { get; set; }

    public DeleteLatestMatchStateCommand(int matchId)
    {
        MatchId = matchId;
    }

    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }
}
