using RacketReel.Services.Matches.API.Application.Dtos;

namespace RacketReel.Services.Matches.API.Application.Commands;

public class CreateMatchStateCommandResponse
{
    public StateDto State { get; }
    public int StateIndex { get; }

    public CreateMatchStateCommandResponse(StateDto state, int stateIndex)
    {
        State = state;
        StateIndex = stateIndex;
    }
}
