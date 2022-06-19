using System.Text.Json;
using System.Text.Json.Serialization;
using MediatR;
using RacketReel.Services.Matches.API.Application.Dtos;

namespace RacketReel.Services.Matches.API.Application.Commands;

public class CreateMatchStateCommand : IRequest<CreateMatchStateCommandResponse>
{

    public string PointTo { get; private set; }
    public int MatchId { get; set; }

    [JsonConstructor]
    public CreateMatchStateCommand(string pointTo, int matchId)
    {
        PointTo = pointTo;
        MatchId = matchId;
    }

    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }
}
