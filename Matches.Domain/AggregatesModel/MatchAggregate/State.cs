using Matches.Domain.SeedWork;

namespace Matches.Domain.AggregatesModel.MatchAggregate;

public class State : Entity
{
    public DateTime CreatedAtDateTime { get; private set; } = DateTime.MinValue;

    public ParticipantEnum Serving { get; set; } = ParticipantEnum.One;

    public Score Score { get; private set; } = Score.Initial();

    public bool Highlight { get; set; }

    public State() {}

    public State(
        DateTime createdAtDateTime,
        ParticipantEnum serving,
        Score score,
        bool highlight = false)
    {
        CreatedAtDateTime = createdAtDateTime;
        Serving = serving;
        Score = score;
        Highlight = highlight;
    }

    public static State Initial(ParticipantEnum servingFirst)
    {
        return new State(DateTime.UtcNow, servingFirst, Score.Initial());
    }
}