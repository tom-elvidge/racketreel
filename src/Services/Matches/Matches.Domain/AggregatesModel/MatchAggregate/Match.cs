using System;
using System.Linq;
using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.SeedWork;
using RacketReel.Services.Matches.Domain.Exceptions;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class Match : Entity, IAggregateRoot
{
    public DateTime CreatedDateTime { get; private set; }
    // Participant as it could be a player or a doubles pair
    public string ParticipantOne { get; private set; }
    public string ParticipantTwo { get; private set; }
    public Format Format { get; private set; }
    private readonly List<State> _states;
    public IReadOnlyCollection<State> States => _states;

    public Match()
    {
        
    }

    public Match(string participantOne, string participantTwo, Format format, int servingFirst)
    {
        CreatedDateTime = DateTime.UtcNow;
        ParticipantOne = participantOne;
        ParticipantTwo = participantTwo;
        Format = format;
        _states = new List<State> { State.InitialState(servingFirst) };
    }

    public State GetLatestState()
    {
        return GetStateByIndex(_states.Count()-1);
    }

    public State GetStateByIndex(int i)
    {
        _states.OrderBy(s => s.CreatedDateTime);
        return _states[i];
    }

    public void RemoveLastState()
    {
        if (_states.Count() == 1)
        {
            throw new MatchesDomainException("Cannot remove the initial state");
        }

        _states.Remove(GetLatestState());
    }

    public void AddState(int player)
    {
        if (!(player == 0 || player == 1))
        {
            throw new MatchesDomainException("player must be either 0 or 1");
        }

        // Todo: Implement scoring logic
        _states.Add(new State(
            DateTime.UtcNow, 
            new Score(1,1,1,1,1,1),
            player
        ));
    }

    public bool IsComplete()
    {
        // Todo: Cache this and invalidate the cache whenever a new state is pushed
        // Todo: For dev implement a cache which always misses and does nothing with the update
        // Todo: Compute from the latest state and the format
        return false;
    }

    public bool IsGamePoint()
    {
        // Todo: Cache this and invalidate the cache whenever a new state is pushed
        // Todo: Compute from the latest state and the format
        return false;
    }

    public bool IsSetPoint()
    {
        // Todo: Cache this and invalidate the cache whenever a new state is pushed
        // Todo: Compute from the latest state and the format
        return false;
    }

    public bool IsMatchPoint()
    {
        // Todo: Cache this and invalidate the cache whenever a new state is pushed
        // Todo: Compute from the latest state and the format
        return false;
    }
}
