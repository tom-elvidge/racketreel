using Matches.Application.Models;
using Matches.Application.Models.Match;
using Matches.Domain;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.AggregatesModel.MatchAggregate.Formats;
using Format = Matches.Application.Models.Match.Format;
using Formats_Format = Matches.Domain.AggregatesModel.MatchAggregate.Formats.Format;
using Match_Format = Matches.Application.Models.Match.Format;
using Models_Match_Format = Matches.Application.Models.Match.Format;

namespace Matches.Application.Services;

public static class MatchCreator
{
    public static Match CreateMatch(MatchEntity matchEntity)
    {
        var firstState = matchEntity.States.MinBy(s => s.CreatedAtDateTime)!;
        var lastState = matchEntity.States.MaxBy(s => s.CreatedAtDateTime)!;
        
        return new Match(
            matchEntity.Id,
            matchEntity.UserId,
            firstState.CreatedAtDateTime,
            lastState.CreatedAtDateTime,
            GetFormatAsEnum(matchEntity.Format),
            matchEntity.ParticipantOne.Name,
            matchEntity.ParticipantTwo.Name,
            lastState.Score.P1Sets > lastState.Score.P2Sets ? Team.TeamOne : Team.TeamTwo,
            ComputeSetSummary(matchEntity, 0)!,
            ComputeSetSummary(matchEntity, 1),
            ComputeSetSummary(matchEntity, 2),
            ComputeSetSummary(matchEntity, 3),
            ComputeSetSummary(matchEntity, 4));
    }

    private static Set? ComputeSetSummary(MatchEntity matchEntity, int set)
    {
        var stateCount = matchEntity.States.Count;
        var states = matchEntity.States
            .OrderBy(s => s.CreatedAtDateTime)
            .ToList();
        
        // Find last state of set and first state of next set
        var currentSet = 0;
        var stateIndex = 0;
        while (currentSet <= set)
        {
            // This set was never played
            if (stateIndex >= stateCount) return null;
            
            currentSet = states[stateIndex].Score.P1Sets + states[stateIndex].Score.P2Sets;
            stateIndex++;
        }
        
        var firstStateOfNextSet = states[stateIndex-1];
        var lastStateOfSet = states[stateIndex-2];

        var completedAt = firstStateOfNextSet.CreatedAtDateTime;
        var winner = firstStateOfNextSet.Score.P1Sets > lastStateOfSet.Score.P1Sets ? Team.TeamOne : Team.TeamTwo;
        
        var teamOneGames = lastStateOfSet.Score.P1Games;
        var teamTwoGames = lastStateOfSet.Score.P2Games;
        if (winner == Team.TeamOne)
            teamOneGames++;
        else
            teamTwoGames++;

        var tiebreak = Scorer.IsTiebreak(matchEntity.Format, lastStateOfSet);
        int? teamOneTiebreakPoints = null;
        int? teamTwoTiebreakPoints = null;
        if (tiebreak)
        {
            teamOneTiebreakPoints = lastStateOfSet.Score.P1Points;
            teamTwoTiebreakPoints = lastStateOfSet.Score.P2Points;
            if (winner == Team.TeamOne)
                teamOneTiebreakPoints++;
            else
                teamTwoTiebreakPoints++;
        }

        return new Set(
            completedAt,
            winner,
            teamOneGames,
            teamTwoGames,
            tiebreak,
            teamOneTiebreakPoints,
            teamTwoTiebreakPoints);
    }
    
    public static Models_Match_Format GetFormatAsEnum(Formats_Format format)
    {
        if (format.Equals(TiebreakToTen.Create()))
        {
            return Models_Match_Format.TiebreakToTen;
        }
        if (format.Equals(BestOfOne.Create()))
        {
            return Models_Match_Format.BestOfOne;
        }
        if (format.Equals(BestOfThree.Create()))
        {
            return Models_Match_Format.BestOfThree;
        }
        if (format.Equals(BestOfFive.Create()))
        {
            return Models_Match_Format.BestOfFive;
        }
        if (format.Equals(BestOfThreeFinalSetTiebreak.Create()))
        {
            return Models_Match_Format.BestOfThreeFinalSetTiebreak;
        }
        if (format.Equals(BestOfFiveFinalSetTiebreak.Create()))
        {
            return Models_Match_Format.BestOfFiveFinalSetTiebreak;
        }
        if (format.Equals(FastFour.Create()))
        {
            return Models_Match_Format.FastFour;
        }
        throw new ApplicationException($"format {format} is not recognized as an option");
    }
}