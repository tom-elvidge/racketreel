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
        var minimumSetsToWin = format.MinimumSetsToWin();

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
}