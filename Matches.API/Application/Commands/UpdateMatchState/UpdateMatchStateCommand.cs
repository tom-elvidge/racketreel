using System.Text.Json;
using System.Text.Json.Serialization;
using MediatR;
using RacketReel.Services.Matches.API.Application.Dtos;

namespace RacketReel.Services.Matches.API.Application.Commands.CreateMatch;

public class UpdateMatchStateCommand: IRequest<StateDto>
{
    public bool Highlight { get; set; }
    public int MatchId { get; set; }
    // if null then update the latest match state
    public int? StateIndex { get; set; }

    [JsonConstructor]
    public UpdateMatchStateCommand(bool highlight, int matchId, int? stateIndex)
    {
        Highlight = highlight;
        MatchId = matchId;
        StateIndex = stateIndex;
    }
    
    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }
}