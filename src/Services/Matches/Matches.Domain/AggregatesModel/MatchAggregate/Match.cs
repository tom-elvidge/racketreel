using System;
using System.Linq;
using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.SeedWork;
using RacketReel.Services.Matches.Domain.Exceptions;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class Match : Entity, IAggregateRoot
{
    public DateTime CreatedDateTime { get; private set; }
    public (string, string) Players { get; private set; }
    public Format Format { get; private set; }
    public ICollection<State> States { get; private set; }

    public Match((string, string) players, Format format, int servingFirst)
    {
        CreatedDateTime = DateTime.Now;
        Players = players;
        Format = format;
        States = new List<State> { State.InitialState(servingFirst) };
    }

    public State GetCurrentState()
    {
        States.OrderByDescending(s => s.CreatedDateTime);
        return States.First();
    }

    public void RemoveCurrentState()
    {
        if (States.Count() == 1)
        {
            throw new MatchesDomainException("cannot remove the initial state");
        }

        States.Remove(GetCurrentState());
    }

    public void AddState(int player)
    {
        if (!(player == 0 || player == 1))
        {
            throw new MatchesDomainException("player must be either 0 or 1");
        }

        // Todo: Implement scoring logic
    }

    public bool IsComplete()
    {
        // Todo: Cache this and invalidate the cache whenever a new state is pushed
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
