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
    /// Returns the minimum number of points needed to win the states current game.
    /// </summary>
    /// <param name="format">The format of the match.</param>
    /// <param name="state">The state to get the current game for.</param>
    public static int GetMinimumPointsToWinCurrentGame(Format format, State state)
    {
        // ordinary game so must win at least 4 points
        if (!IsTiebreak(format, state))
        {
            return 4;
        }

        var isFinalSet = IsFinalSet(format, state);
        
        var tiebreakRule = isFinalSet
            ? format.TiebreakRule
            : format.TiebreakRuleFinalSet;
        
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

    public static ParticipantSelectorEnum GetGamePointParticipant(Format format, State state)
    {
        var minPoints = GetMinimumPointsToWinCurrentGame(format, state);
        var isTiebreak = IsTiebreak(format, state);
        var p1Points = state.Score.P1Points;
        var p2Points = state.Score.P2Points;

        // advantage point scoring
        if (!format.SuddenDeathDeuce || isTiebreak)
        {
            if ((p1Points >= minPoints - 1) && (p1Points > p2Points))
            {
                return ParticipantSelectorEnum.One;
            }

            if ((p2Points >= minPoints - 1) && (p2Points > p1Points))
            {
                return ParticipantSelectorEnum.Two;
            }

            return ParticipantSelectorEnum.Neither;
        }

        // sudden death scoring
        if ((p1Points >= minPoints - 1)
            && (p2Points >= minPoints - 1))
        {
            return ParticipantSelectorEnum.Both;
        }
        
        return ParticipantSelectorEnum.Neither;
    }
}