namespace RacketReel.Domain.AggregatesModel.MatchAggregate.Participants;

public sealed class UserParticipant : BaseParticipant
{
    public string UserId { get; private set; }

    public UserParticipant(string userId)
    {
        UserId = userId;
    }
}