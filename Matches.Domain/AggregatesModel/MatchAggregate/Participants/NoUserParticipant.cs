namespace Matches.Domain.AggregatesModel.MatchAggregate.Participants;

public sealed class NoUserParticipant : BaseParticipant
{
    public string Name { get; private set; }

    public NoUserParticipant(string name)
    {
        Name = name;
    }
}