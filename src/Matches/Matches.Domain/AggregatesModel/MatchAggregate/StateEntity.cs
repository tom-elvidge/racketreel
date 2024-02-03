using Matches.Domain.SeedWork;

namespace Matches.Domain.AggregatesModel.MatchAggregate;

public class StateEntity : Entity
{
    public int Version { get; set; }
    public DateTime CreatedAtDateTime { get; private set; } = DateTime.MinValue;

    public ParticipantEnum Serving { get; set; } = ParticipantEnum.One;

    public Score Score { get; private set; } = Score.Initial();

    public bool Highlight { get; set; }

    public StateEntity() {}

    public StateEntity(
        DateTime createdAtDateTime,
        ParticipantEnum serving,
        Score score,
        bool highlight = false,
        int version = 0)
    {
        CreatedAtDateTime = createdAtDateTime;
        Serving = serving;
        Score = score;
        Highlight = highlight;
        Version = version;
    }

    public static StateEntity Initial(ParticipantEnum servingFirst)
    {
        return new StateEntity(DateTime.UtcNow, servingFirst, Score.Initial());
    }
}