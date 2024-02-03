namespace Matches.Domain.AggregatesModel.MatchAggregate.Participants;

public sealed class DoublesParticipant : BaseParticipant
{
    public BaseParticipant One { get; private set; }

    public BaseParticipant Two { get; private set; }

    public DoublesParticipant(BaseParticipant one, BaseParticipant two)
    {
        One = one;
        Two = two;
    }
}