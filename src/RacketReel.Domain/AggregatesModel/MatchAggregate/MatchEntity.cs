using RacketReel.Domain.AggregatesModel.MatchAggregate.Formats;
using RacketReel.Domain.AggregatesModel.MatchAggregate.Participants;
using RacketReel.Domain.Exceptions;
using RacketReel.Domain.SeedWork;

namespace RacketReel.Domain.AggregatesModel.MatchAggregate;

public class MatchEntity : Entity, IAggregateRoot
{
    public DateTime CreatedAtDateTime { get; private set; } = DateTime.MinValue;
    
    public DateTime CompletedAtDateTime { get; private set; } = DateTime.MaxValue;

    public NoUserParticipant ParticipantOne { get; private set; } = new NoUserParticipant("Player One");

    public NoUserParticipant ParticipantTwo { get; private set; } = new NoUserParticipant("Player Two");

    public ParticipantEnum ServingFirst { get; private set; } = ParticipantEnum.One;

    /// <summary>
    /// Describes the rules for scoring the match.
    /// </summary>
    public Format Format { get; private set; } = BestOfThreeSevenPointTiebreaker.Create();

    /// <summary>
    /// The collection of all unique states in the match in no particular order.
    /// </summary>
    public IReadOnlyCollection<StateEntity> States => _states;

    private readonly List<StateEntity> _states = new List<StateEntity>();

    public MatchEntity() {}

    public MatchEntity(
        DateTime createdAtDateTime,
        DateTime completedAtDateTime,
        NoUserParticipant participantOne,
        NoUserParticipant participantTwo,
        ParticipantEnum servingFirst,
        Format format,
        List<StateEntity> states)
    {
        CreatedAtDateTime = createdAtDateTime;
        CompletedAtDateTime = completedAtDateTime;
        ParticipantOne = participantOne;
        ParticipantTwo = participantTwo;
        ServingFirst = servingFirst;
        Format = format;
        _states = states;
    }

    public static MatchEntity Create(
        NoUserParticipant participantOne,
        NoUserParticipant participantTwo,
        ParticipantEnum servingFirst,
        Format format)
    {
        return new MatchEntity(
            DateTime.UtcNow,
            DateTime.MaxValue, // DateTime.MaxValue indicates this match is not complete
            participantOne,
            participantTwo,
            servingFirst,
            format,
            new List<StateEntity> { StateEntity.Initial(servingFirst) });
    }

    /// <summary>
    /// Return true if this match is complete and false otherwise.
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
        if (States.Count == 0)
        {
            throw new MatchHasNoStatesDomainException($"{nameof(Update)} requires the match to have states");
        }

        if (IsComplete()) {
            throw new CannotUpdateACompletedMatchDomainException();
        }

        var lastState = States
            .OrderBy(s => s.CreatedAtDateTime)
            .LastOrDefault()!;

        var newState = new StateEntity(
            DateTime.UtcNow,
            ParticipantEnum.One, // placeholder
            Scorer.GetNewScore(Format, lastState, participant),
            false);
        newState.Serving = GetNewStateServing(newState, lastState);

        _states.Add(newState);

        if (IsComplete())
        {
            CompletedAtDateTime = DateTime.UtcNow;
        }
    }

    private ParticipantEnum GetNewStateServing(StateEntity newState, StateEntity lastState)
    {
        var lastStateTiebreak = Scorer.IsTiebreak(Format, lastState);
        var newStateTiebreak = Scorer.IsTiebreak(Format, newState);

        // new game after a tiebreak game has been complete
        if (lastStateTiebreak && !newStateTiebreak)
        {
            // participant who received first in the tiebreak should serve in the new game
            _states.OrderBy(s => s.CreatedAtDateTime).Reverse();
            foreach (var state in _states)
            {
                if (state.Score.P1Points == 0 && state.Score.P2Points == 0)
                {
                    return state.Serving == ParticipantEnum.One
                        ? ParticipantEnum.Two
                        : ParticipantEnum.One;
                }
            }
            throw new DomainException("iterated backwards through all states without finding the start of the tiebreak");
        }

        // is there a new game starting in newState?
        var newGameStarting = newState.Score.P1Points == 0
            && newState.Score.P2Points == 0;

        // is the newState a tiebreak and has there been an odd number of points played?
        var oddNumberOfTiebreakPointsPlayed = newStateTiebreak
            && (newState.Score.P1Points + newState.Score.P2Points) % 2 != 0;

        // swap serve
        if (newGameStarting || oddNumberOfTiebreakPointsPlayed)
        {
            return lastState.Serving == ParticipantEnum.One
                ? ParticipantEnum.Two
                : ParticipantEnum.One;
        }

        // do not swap serve
        return lastState.Serving;
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

        // If the match was already completed then reset the CompletedAtDateTime
        if (IsComplete())
        {
            CompletedAtDateTime = DateTime.MaxValue;
        }

        var lastState = States
            .OrderBy(s => s.CreatedAtDateTime)
            .LastOrDefault()!;
        _states.Remove(lastState);
    }

    /// <summary>
    /// Return the participant who should serve first in the set after this tiebreak is complete. Throws an exception if the last state is not in a tiebreak.
    /// </summary>
    private ParticipantEnum GetServingAfterTiebreak()
    {
        if (States.Count == 0)
        {
            throw new MatchHasNoStatesDomainException($"{nameof(GetServingAfterTiebreak)} requires the match to have states");
        }

        var lastState = States
            .OrderBy(s => s.CreatedAtDateTime)
            .LastOrDefault()!;

        if (!Scorer.IsTiebreak(Format, lastState))
        {
            throw new DomainException($"{nameof(GetServingAfterTiebreak)} cannot be called when the last state is not in a tiebreak");
        }

        // iterate backwards through the states until the start of the tiebreak is found
        // the participant who received at the start of the tiebreak will serve first in the next set
        foreach (var state in States.OrderBy(s => s.CreatedAtDateTime).Reverse())
        {
            if (state.Score.P1Points == 0 && state.Score.P2Points == 0)
            {
                return state.Serving == ParticipantEnum.One ? ParticipantEnum.One : ParticipantEnum.Two;
            }
        }

        throw new DomainException($"{nameof(GetServingAfterTiebreak)} iterated through all the states without finding the state at the start of the tiebreak");
    }
}