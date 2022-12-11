using Matches.Domain.SeedWork;

namespace Matches.Domain.AggregatesModel.MatchAggregate;

public class State : Entity
{
    public DateTime CreatedAtDateTime { get; private set; } = DateTime.MinValue;

    public ParticipantEnum Serving { get; private set; } = ParticipantEnum.One;

    public Score Score { get; private set; } = Score.Initial();

    public bool Tiebreak { get; private set; }

    public bool Highlight { get; set; }

    public State(DateTime createdAtDateTime, ParticipantEnum serving, Score score)
    {
        CreatedAtDateTime = createdAtDateTime;
        Serving = serving;
        Score = score;
    }

    public static State Initial(ParticipantEnum servingFirst)
    {
        return new State(DateTime.UtcNow, servingFirst, Score.Initial());
    }
}
