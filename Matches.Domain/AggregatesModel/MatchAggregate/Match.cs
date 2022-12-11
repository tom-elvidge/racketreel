using Matches.Domain.AggregatesModel.MatchAggregate.Formats;
using Matches.Domain.AggregatesModel.MatchAggregate.Participants;
using Matches.Domain.Exceptions;
using Matches.Domain.SeedWork;

namespace Matches.Domain.AggregatesModel.MatchAggregate;

public class Match : Entity, IAggregateRoot
{
    public DateTime CreatedAtDateTime { get; private set; } = DateTime.MinValue;

    public BaseParticipant ParticipantOne { get; private set; } = new NoUserParticipant("Player One");

    public BaseParticipant ParticipantTwo { get; private set; } = new NoUserParticipant("Player Two");

    public ParticipantEnum ServingFirst { get; private set; } = ParticipantEnum.One;

    /// <summary>
    /// Describes the rules for scoring the match.
    /// </summary>
    public Format Format { get; private set; } = BestOfThreeSevenPointTiebreaker.Create();

    /// <summary>
    /// The collection of all unique states in the match in no particular order.
    /// </summary>
    public IReadOnlyCollection<State> States => _states;

    private readonly List<State> _states = new List<State>();

    public Match(
        DateTime createdAtDateTime,
        BaseParticipant participantOne,
        BaseParticipant participantTwo,
        ParticipantEnum servingFirst,
        Format format,
        List<State> states)
    {
        CreatedAtDateTime = createdAtDateTime;
        ParticipantOne = participantOne;
        ParticipantTwo = participantTwo;
        ServingFirst = servingFirst;
        Format = format;
        _states = states;
    }

    public static Match Create(
        BaseParticipant participantOne,
        BaseParticipant participantTwo,
        ParticipantEnum servingFirst,
        Format format)
    {
        return new Match(
            DateTime.UtcNow,
            participantOne,
            participantTwo,
            servingFirst,
            format,
            new List<State> { State.Initial(servingFirst) });
    }

    /// <summary>
    /// Return true if the match is complete and false otherwise.
    /// </summary>
    public bool IsComplete()
    {
        if (States.Count == 0)
        {
            throw new MatchHasNoStatesDomainException($"{nameof(IsComplete)} requires the match to have states");
        }

        var lastState = States
            .OrderBy(s => s.CreatedAtDateTime)
            .LastOrDefault()!;

        return Scorer.IsComplete(Format, lastState);
    }

    /// <summary>
    /// Update the match when a participant scores a point. Compute and append the next state.
    /// </summary>
    /// <param name="participant">The participant which scored a point.</param>
    public void Update(ParticipantEnum participant)
    {
    }

    /// <summary>
    /// Undo the last update to the match.
    /// </summary>
    public void Undo()
    {
        if (States.Count == 0)
        {
            throw new MatchHasNoStatesDomainException($"{nameof(Undo)} requires the match to have states");
        }

        if (States.Count == 1)
        {
            throw new CannotUndoInitialStateDomainException();
        }

        var lastState = States
            .OrderBy(s => s.CreatedAtDateTime)
            .LastOrDefault()!;
        _states.Remove(lastState);
    }

}