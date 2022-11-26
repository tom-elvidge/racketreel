using System;
using System.Linq;
using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.SeedWork;
using RacketReel.Services.Matches.Domain.Exceptions;

#nullable enable

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public class Match : Entity, IAggregateRoot
{
    public DateTime CreatedDateTime { get; private set; }
    // Participant as it could be a player or a doubles pair
    public string ParticipantOne { get; private set; }
    public string ParticipantTwo { get; private set; }
    public Format Format { get; private set; }
    // nullable as may not want to get states when getting all matches
    private readonly List<State>? _states;
    public IReadOnlyCollection<State>? States => _states;
    
    // Recompute Complete every time a state is added or removed
    // Todo: Cache IsComplete and invalidate every time a new state is added or removed
    public bool Complete { get; set; }

    public Match()
    {
        // Setting non-null values but these will be overwritten by EF on get
        CreatedDateTime = DateTime.UtcNow;
        ParticipantOne = "Player One";
        ParticipantTwo = "Player Two";
        Format = new Format();
        Complete = false;
    }

    public Match(string participantOne, string participantTwo, Format format, Participant servingFirst)
    {
        CreatedDateTime = DateTime.UtcNow;
        ParticipantOne = participantOne;
        ParticipantTwo = participantTwo;
        Format = format;
        _states = new List<State> { State.InitialState(servingFirst) };
        Complete = false;
    }

    public State GetLatestState()
    {
        if (_states == null) 
        {
            throw new MatchesDomainOperationRequiresStatesException();
        }

        return GetStateByIndex(_states.Count()-1);
    }

    public State GetStateByIndex(int i)
    {
        if (_states == null) 
        {
            throw new MatchesDomainOperationRequiresStatesException();
        }

        _states.OrderBy(s => s.CreatedDateTime);
        return _states[i];
    }

    public void RemoveLastState()
    {
        if (_states == null) 
        {
            throw new MatchesDomainOperationRequiresStatesException();
        }

        if (_states.Count() == 1)
        {
            throw new MatchesDomainException("Cannot remove the initial state");
        }

        _states.Remove(GetLatestState());
        Complete = IsComplete(GetLatestState());
    }

    public void AddState(Participant participant)
    {
        if (_states == null) 
        {
            throw new MatchesDomainOperationRequiresStatesException();
        }

        var latestState = GetLatestState();
        if (Complete)
        {
            throw new MatchesDomainException("cannot add a new state to a complete match");
        }

        var gamePointTo = IsGamePointTo(latestState);
        var setPointTo = IsSetPointTo(latestState);

        var newState = latestState.Copy();

        // todo: fix repeat code
        if (participant == Participant.One)
        {
            // points
            if (!latestState.IsTieBreak && latestState.Score.ParticipantTwoPoints == 4)
            {
                // back from advantage to deuce
                newState.Score.ParticipantTwoPoints -= 1;
            }
            else
            {
                newState.Score.ParticipantOnePoints += 1;
            }
            // games
            if (gamePointTo == Participant.One)
            {
                newState.Score.ParticipantOneGames += 1;
                newState.Score.ResetPoints();
            }
            // sets
            if (setPointTo == Participant.One)
            {
                newState.Score.ParticipantOneSets += 1;
                newState.Score.ResetGames();
            }
        }
        if (participant == Participant.Two)
        {
            // points
            if (!latestState.IsTieBreak && latestState.Score.ParticipantOnePoints == 4)
            {
                // back from advantage to deuce
                newState.Score.ParticipantOnePoints -= 1;
            }
            else
            {
                newState.Score.ParticipantTwoPoints += 1;
            }
            // games
            if (gamePointTo == Participant.Two)
            {
                newState.Score.ParticipantTwoGames += 1;
                newState.Score.ResetPoints();
            }
            // sets
            if (setPointTo == Participant.Two)
            {
                newState.Score.ParticipantTwoSets += 1;
                newState.Score.ResetGames();
            }
        }

        // check if still tie break now new score is known
        newState.IsTieBreak = IsTieBreak(newState);

        // swap serve after an odd number of points during a tie break
        if (newState.IsTieBreak)
        {
            var totalTieBreakPoints = newState.Score.ParticipantOnePoints + newState.Score.ParticipantTwoPoints;
            if (totalTieBreakPoints % 2 != 0)
            {
                newState.Serving = latestState.Serving == Participant.One ? Participant.Two : Participant.One;
            }
        }

        // swap serve if a new game is starting
        if (newState.Score.ParticipantOnePoints == 0 && newState.Score.ParticipantTwoPoints == 0)
        {
            newState.Serving = latestState.Serving == Participant.One ? Participant.Two : Participant.One;
        }

        // reset the serving player after a tiebreak
        // this will take precedence the swap serve if new game is starting rule
        if (latestState.IsTieBreak && !newState.IsTieBreak)
        {
            newState.Serving = GetPostTieBreakServing();
        }

        _states.Add(newState);
        Complete = IsComplete(newState);
    }

    private Participant GetPostTieBreakServing()
    {
        if (_states == null) 
        {
            throw new MatchesDomainOperationRequiresStatesException();
        }

        if (!GetLatestState().IsTieBreak)
        {
            throw new MatchesDomainException("cannot get post tie break serving if not in a tie break");
        }

        // iterate backwards through the states until the start of the tie break is found
        _states.OrderBy(s => s.CreatedDateTime).Reverse();
        foreach (var state in _states)
        {
            if (state.Score.ParticipantOnePoints == 0 && state.Score.ParticipantTwoPoints == 0)
            {
                // player who received at the start of the tie break will serve in the next match
                return state.Serving == Participant.One ? Participant.Two : Participant.One;
            }
        }

        throw new MatchesDomainException("iterated backwards through all states without finding the start of the tie break");
    }

    public bool IsTieBreak(State state)
    {
        var setType = GetSetType(state);

        if (setType == SetType.SixAllAdvantageRule)
        {
            // never a tie break
            return false;
        }
        if (setType == SetType.SuperTiebreaker)
        {
            // one game which is always a tie break
            return true;
        }
        if (setType == SetType.WimbledonFinalSet)
        {
            // Wimbledon allows the final set to go to 12-12 before introducing a tie break
            if (state.Score.ParticipantOneGames == 12 && state.Score.ParticipantTwoGames == 12)
            {
                return true;
            }
            return false;
        }
        if (setType == SetType.SixAllTwelvePointTiebreaker || setType == SetType.SixAllTenPointTiebreaker)
        {
            if (state.Score.ParticipantOneGames == 6 && state.Score.ParticipantTwoGames == 6)
            {
                return true;
            }
            return false;
        }

        throw new MatchesDomainException($"missing implementation to check tie break condition for {setType}");
    }

    public bool IsComplete(State state)
    {
        var requiredSets = Math.Ceiling((double) this.Format.Sets/2);
        return (state.Score.ParticipantOneSets == requiredSets || state.Score.ParticipantTwoSets == requiredSets);
    }

    public Participant? IsGamePointTo(State state)
    {
        // Todo: Cache this and invalidate the cache whenever a new state is pushed
        var requiredPoints = GetRequiredPoints(state);
        if (GameOrMatchPointToA(requiredPoints, state.Score.ParticipantOnePoints, state.Score.ParticipantTwoPoints))
        {
            return Participant.One;
        }
        if (GameOrMatchPointToA(requiredPoints, state.Score.ParticipantTwoPoints, state.Score.ParticipantOnePoints))
        {
            return Participant.Two;
        }
        return null;
    }

    private static bool GameOrMatchPointToA(int minimum, int a, int b)
    {
        return ((a >= minimum - 1) && (a > b));
    }

    private int GetRequiredPoints(State state)
    {
        var setType = GetSetType(state);
        if (setType == SetType.SuperTiebreaker)
        {
            return 10;
        }
        if (setType == SetType.SixAllTwelvePointTiebreaker && state.IsTieBreak)
        {
            return 7;
        }
        if (setType == SetType.SixAllTenPointTiebreaker && state.IsTieBreak)
        {
            return 10;
        }
        if (setType == SetType.WimbledonFinalSet && state.IsTieBreak)
        {
            return 7;
        }
        return 4;
    }

    private SetType GetSetType(State state)
    {
        if (IsFinalSet(state))
        {
            return this.Format.FinalSetType;
        }
        return this.Format.NormalSetType;
    }

    private bool IsFinalSet(State state)
    {
        var completeSets = state.Score.ParticipantOneSets + state.Score.ParticipantTwoSets;
        return (completeSets == this.Format.Sets - 1);
    }

    public Participant? IsSetPointTo(State state)
    {
        // Todo: Cache this and invalidate the cache whenever a new state is pushed
        var gamePointTo = IsGamePointTo(state);
        if (GetSetType(state) == SetType.WimbledonFinalSet)
        {
            // only one game so just check game point
            return gamePointTo;
        }
        // all other sets require at least 6 games
        var requiredGames = 6;
        // win by game advantage rule if set doesn't reach a tie break
        if (GameOrMatchPointToA(requiredGames, state.Score.ParticipantOneGames, state.Score.ParticipantTwoGames) && gamePointTo == Participant.One)
        {
            return Participant.One;
        }
        if (GameOrMatchPointToA(requiredGames, state.Score.ParticipantTwoGames, state.Score.ParticipantOneGames) && gamePointTo == Participant.Two)
        {
            return Participant.Two;
        }
        // if we make it to a tie break then game point is set point
        if (state.IsTieBreak)
        {
            return gamePointTo;
        }
        return null;
    }

    public Participant? IsMatchPointTo(State state)
    {
        // Todo: Cache this and invalidate the cache whenever a new state is pushed
        var requiredSets = Math.Ceiling((double) this.Format.Sets/2);
        var setPointTo = IsSetPointTo(state);
        if ((state.Score.ParticipantOneSets == requiredSets - 1) && setPointTo == Participant.One)
        {
            return Participant.One;
        }
        if ((state.Score.ParticipantTwoSets == requiredSets - 1) && setPointTo == Participant.Two)
        {
            return Participant.Two;
        }
        return null;
    }
}
