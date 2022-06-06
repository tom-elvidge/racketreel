using System.Collections.Generic;
using System.Text.Json;
using System.Text.Json.Serialization;
using MediatR;
using RacketReel.Services.Matches.API.Application.Dtos;

namespace RacketReel.Services.Matches.API.Application.Commands;

public class CreateMatchCommand : IRequest<MatchDto>
{
    public IEnumerable<string> Players { get; set; }
    public string ServingFirst { get; private set; }
    public int Sets { get; private set; }
    public string SetType { get; private set; }
    public string FinalSetType { get; private set; }

    [JsonConstructor]
    public CreateMatchCommand(IEnumerable<string> players, string servingFirst, int sets, string setType, string finalSetType)
    {
        Players = players;
        ServingFirst = servingFirst;
        Sets = sets;
        SetType = setType;
        FinalSetType = finalSetType;
    }

    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }
}
