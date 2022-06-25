namespace RacketReel.Web.Data;

public class Match
{
    public int Id { get; private set; }
    public DateTime CreatedDateTime { get; private set; }
    public IEnumerable<string> Players { get; private set; }
    public string ServingFirst { get; private set; }
    public int Sets { get; private set; }
    public string SetType { get; private set; }
    public string FinalSetType { get; private set; }
    public IEnumerable<State> States { get; private set; }

    public Match(int id, DateTime createdDateTime, IEnumerable<string> players, string servingFirst, int sets, string setType, string finalSetType, IEnumerable<State> states)
    {
        Id = id;
        CreatedDateTime = createdDateTime;
        Players = players;
        ServingFirst = servingFirst;
        Sets = sets;
        SetType = setType;
        FinalSetType = finalSetType;
        States = states;
    }
}
