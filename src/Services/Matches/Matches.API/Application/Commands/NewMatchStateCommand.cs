using System.Text.Json;
using System.Text.Json.Serialization;
using MediatR;
using RacketReel.Services.Matches.API.Application.Dtos;

namespace RacketReel.Services.Matches.API.Application.Commands;

public class NewMatchStateCommand : IRequest<StateDto>
{

    public string PointTo { get; private set; }
    public int MatchId { get; set; }

    [JsonConstructor]
    public NewMatchStateCommand(string pointTo, int matchId)
    {
        PointTo = pointTo;
        MatchId = matchId;
    }

    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }
}
