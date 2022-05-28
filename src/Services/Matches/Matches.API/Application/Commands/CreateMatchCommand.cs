using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using MediatR;

namespace RacketReel.Services.Matches.API.Application.Commands;

[DataContract]
public class CreateMatchCommand : IRequest<bool>
{
    [DataMember]
    private readonly List<string> _players;

    [DataMember]
    public IEnumerable<string> Players => _players;

    [DataMember]
    public string ServingFirst { get; private set; }

    [DataMember]
    public int Sets { get; private set; }

    [DataMember]
    public string SetType { get; private set; }

    [DataMember]
    public string FinalSetType { get; private set; }

    public CreateMatchCommand()
    {
        _players = new List<string>();
    }

    public CreateMatchCommand(IEnumerable<string> players, string servingFirst, int sets, string setType, string finalSetType)
    {
        _players = players.ToList();
        ServingFirst = servingFirst;
        Sets = sets;
        SetType = setType;
        FinalSetType = finalSetType;
    }
}
