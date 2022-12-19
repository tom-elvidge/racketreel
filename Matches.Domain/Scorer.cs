using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.AggregatesModel.MatchAggregate.Formats;
using Matches.Domain.Exceptions;

namespace Matches.Domain;

/// <summary>
/// Collection of static methods to help when updating a Match.
/// </summary>
public static class Scorer
{
    /// <summary>
    /// Return true if the state is complete and false otherwise.
    /// </summary>
    /// <param name="format">The format of the match.</param>
    /// <param name="state">The state to check if the match is complete.</param>
    public static bool IsComplete(Format format, State state)
    {
        var minimumSetsToWin = GetMinimumSetsToWinMatch(format);

        if (state.Score.P1Sets >= minimumSetsToWin || state.Score.P2Sets >= minimumSetsToWin)
        {
            return true;
        }

        return false;
    }

    /// <summary>
    /// Returns true if the state is in the final set and false otherwise.
    /// </summary>
    /// <param name="format">The format of the match.</param>
    /// <param name="state">The state to check if it is in the final set.</param>
    public static bool IsFinalSet(Format format, State state)
    {
        var set = state.Score.P1Sets + state.Score.P2Sets;
        
        switch(format.Sets)
        {
            case SetsEnum._1Enum:
                if (set == 0) return true;
                break;
            case SetsEnum._3Enum:
                if (set == 2) return true;
                break;
            case SetsEnum._5Enum:
                if (set == 4) return true;
                break;
            default:
                throw new DomainException($"{nameof(IsFinalSet)} is missing a case statement for {format.Sets}");
        }

        return false;
    }

    /// <summary>
    /// Returns true if the state is in a tiebreak and false otherwise.
    /// </summary>
    /// <param name="format">The format of the match.</param>
    /// <param name="state">The state to check if it is in a tiebreak.</param>
    public static bool IsTiebreak(Format format, State state)
    {
        var isFinalSet = IsFinalSet(format, state);

        var gameAdvantage = isFinalSet
            ? format.GameAdvantageFinalSet
            : format.GameAdvantage;

        var games = isFinalSet
            ? format.GamesFinalSet
            : format.Games;

        // sets must be won by an advantage so trigger the tiebreak as a last resort
        // when both players have the maximum number of games
        // e.g. in regular sets at 6-6
        var gamesInt = (int) games;
        if (gameAdvantage
            && state.Score.P1Games == gamesInt
            && state.Score.P2Games == gamesInt)
        {
            return true;
        }

        // sets do not have to be won by a game advantage so tiebreaks are triggered early
        // e.g. in fast four sets at 3-3 or 0-0 when only playing a tiebreak
        var gamesIntDec = gamesInt - 1;
        if (!gameAdvantage
            && state.Score.P1Games == gamesIntDec
            && state.Score.P2Games == gamesIntDec)
        {
            return true;
        }

        return false;
    }

    /// <summary>
    /// Returns the minimum number of sets needed to win the match.
    /// </summary>
    /// <param name="format">The format of the match.</param>
    public static int GetMinimumSetsToWinMatch(Format format)
    {
        switch(format.Sets) {
            case SetsEnum._1Enum:
                return 1;
            case SetsEnum._3Enum:
                return 2;
            case SetsEnum._5Enum:
                return 3;
            default:
                throw new DomainException($"{nameof(GetMinimumSetsToWinMatch)} is missing a case statement for {format.Sets}");
        }
    }

    /// <summary>
    /// Returns the minimum number of points needed to win the current game in the passed state.
    /// </summary>
    /// <param name="format">The format of the match.</param>
    /// <param name="state">The state to get the current game for the minimum points to win computation.</param>
    public static int GetMinimumPointsToWinCurrentGame(Format format, State state)
    {
        // ordinary game so must win at least 4 points
        if (!IsTiebreak(format, state))
        {
            return 4;
        }

        var isFinalSet = IsFinalSet(format, state);
        
        var tiebreakRule = isFinalSet
            ? format.TiebreakRuleFinalSet
            : format.TiebreakRule;
        
        switch (tiebreakRule)
        {
            case TiebreakRuleEnum.None:
                throw new DomainException($"The set should never be in a tiebreak if the {nameof(TiebreakRuleEnum)} is {TiebreakRuleEnum.None}");
            case TiebreakRuleEnum.SevenPointTiebreaker:
                return 7;
            case TiebreakRuleEnum.TenPointTiebreaker:
                return 10;
            default:
                throw new DomainException($"{nameof(GetMinimumPointsToWinCurrentGame)} is missing a case statement for {tiebreakRule}");
        }
    }

    /// <summary>
    /// Returns the participant who it is game point to in the passed state.
    /// </summary>
    /// <param name="format">The format of the match.</param>
    /// <param name="state">The state to do the game point check against.</param>
    public static ParticipantSelectorEnum GetGamePointParticipant(Format format, State state)
    {
        var minPoints = GetMinimumPointsToWinCurrentGame(format, state);
        var minPointsDec = minPoints - 1;
        var isTiebreak = IsTiebreak(format, state);
        var p1Points = state.Score.P1Points;
        var p2Points = state.Score.P2Points;

        // advantage point scoring
        if ((!format.SuddenDeathDeuce || isTiebreak)
            && p1Points >= minPointsDec
            && p1Points > p2Points)
        {
            return ParticipantSelectorEnum.One;
        }

        if ((!format.SuddenDeathDeuce || isTiebreak)
            && p2Points >= minPointsDec
            && p2Points > p1Points)
        {
            return ParticipantSelectorEnum.Two;
        }

        if (!format.SuddenDeathDeuce || isTiebreak)
        {
            return ParticipantSelectorEnum.Neither;
        }

        // sudden death scoring
        if (p1Points >= minPointsDec
            && p2Points >= minPointsDec)
        {
            return ParticipantSelectorEnum.Both;
        }

        return ParticipantSelectorEnum.Neither;
    }

    /// <summary>
    /// Returns the participant who it is set point to in the passed state.
    /// </summary>
    /// <param name="format">The format of the match.</param>
    /// <param name="state">The state to do the set point check against.</param>
    public static ParticipantSelectorEnum GetSetPointParticipant(Format format, State state)
    {
        var gamePointParticipant = GetGamePointParticipant(format, state);

        if (IsTiebreak(format, state))
        {
            return gamePointParticipant;
        }

        var isFinalSet = IsFinalSet(format, state);
        var p1Games = state.Score.P1Games;
        var p2Games = state.Score.P2Games;

        var games = isFinalSet
            ? format.GamesFinalSet
            : format.Games;
        var minGames = (int) games;
        var minGamesDec = minGames - 1;

        var gameAdvantage = isFinalSet
            ? format.GameAdvantageFinalSet
            : format.GameAdvantage;

        if (gameAdvantage
            && p1Games >= minGamesDec
            && p1Games > p2Games
            && gamePointParticipant == ParticipantSelectorEnum.One)
        {
            return ParticipantSelectorEnum.One;
        }

        if (gameAdvantage
            && p2Games >= minGamesDec
            && p2Games > p1Games
            && gamePointParticipant == ParticipantSelectorEnum.Two)
        {
            return ParticipantSelectorEnum.Two;
        }
        
        if (!gameAdvantage
            && p1Games >= minGamesDec
            && p2Games >= minGamesDec)
        {
            return gamePointParticipant;
        }

        return ParticipantSelectorEnum.Neither;
    }

    /// <summary>
    /// Returns the participant who it is match point to in the passed state.
    /// </summary>
    /// <param name="format">The format of the match.</param>
    /// <param name="state">The state to do the match point check against.</param>
    public static ParticipantSelectorEnum GetMatchPointParticipant(Format format, State state)
    {
        var setPointParticipant = GetSetPointParticipant(format, state);
        var sets = GetMinimumSetsToWinMatch(format);
        var setsDec = sets - 1;
        var p1Sets = state.Score.P1Sets;
        var p2Sets = state.Score.P2Sets;

        if (p1Sets >= setsDec
            && setPointParticipant == ParticipantSelectorEnum.One)
        {
            return ParticipantSelectorEnum.One;
        }

        if (p2Sets >= setsDec
            && setPointParticipant == ParticipantSelectorEnum.Two)
        {
            return ParticipantSelectorEnum.Two;
        }

        return ParticipantSelectorEnum.Neither;
    }

    /// <summary>
    /// Returns the new score if participant scores a point given the state and format.
    /// </summary>
    /// <param name="format">The format of the match.</param>
    /// <param name="state">The state after which the participant scored.</param>
    /// <param name="participant">The participant which scored the point.</param>
    public static Score GetNewScore(Format format, State state, ParticipantEnum participant)
    {
        var newScore = state.Score.Copy();

        // Convert ParticipantEnum to ParticipantSelectorEnum
        ParticipantSelectorEnum participantSelector;
        if (participant == ParticipantEnum.One)
        {
            participantSelector = ParticipantSelectorEnum.One;
        } else { // participant == ParticipantEnum.Two
            participantSelector = ParticipantSelectorEnum.Two;
        }

        // sets
        var setPointParticipantSelector = Scorer.GetSetPointParticipant(format, state);
        if (participantSelector == setPointParticipantSelector)
        {
            newScore.IncrementSets(participant);
            return newScore;
        }

        // games
        var gamePointParticipantSelector = Scorer.GetGamePointParticipant(format, state);
        if (participantSelector == gamePointParticipantSelector)
        {
            newScore.IncrementGames(participant);
            return newScore;
        }

        // points
        var tiebreak = Scorer.IsTiebreak(format, state);

        // From participant two's advantage back to deuce
        if (!tiebreak && participant == ParticipantEnum.One && state.Score.P2Points == 4)
        {
            newScore.DecrementPoints(ParticipantEnum.Two);
            return newScore;
        }

        // From participant one's advantage back to deuce
        if (!tiebreak && participant == ParticipantEnum.Two && state.Score.P1Points == 4)
        {
            newScore.DecrementPoints(ParticipantEnum.One);
            return newScore;
        }

        newScore.IncrementPoints(participant);
        return newScore;
    }
}