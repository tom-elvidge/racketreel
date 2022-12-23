using Matches.Application.DTOs;
using Matches.Domain;
using Matches.Domain.AggregatesModel.MatchAggregate;

namespace Matches.Application.Services;

public static class SummaryService
{
    public static MatchSummary ComputeMatchSummary(MatchEntity matchEntity)
    {
        var lastState = matchEntity.States
            .OrderBy(s => s.CreatedAtDateTime)
            .LastOrDefault()!;

        var summary = new MatchSummary();
        summary.CompletedAt = lastState.CreatedAtDateTime.ToUniversalTime().ToString("o");
        
        if (lastState.Score.P1Sets > lastState.Score.P2Sets)
        {
            summary.Winner = matchEntity.ParticipantOne.Name;
        } else {
            summary.Winner = matchEntity.ParticipantTwo.Name;
        }

        for (int i = 0; i < (int) matchEntity.Format.Sets; i++)
        {
            var setSummary = ComputeSetSummary(matchEntity, i);
            if (setSummary != null)
            {
                summary.Sets.Add(i, setSummary);
            }
        }
        return summary;
    }

    public static SetSummary ComputeSetSummary(MatchEntity matchEntity, int set)
    {
        // Find last state of set and first state of next set
        var currentSet = 0;
        var stateIndex = 0;
        var stateCount = matchEntity.States.Count();
        var states = matchEntity.States.OrderBy(s => s.CreatedAtDateTime).ToList();
        while (currentSet <= set)
        {
            // This set was never played
            if (stateIndex >= stateCount) return null;
            currentSet = states[stateIndex].Score.P1Sets + states[stateIndex].Score.P2Sets;
            stateIndex++;
        }
        var firstStateOfNextSet = states[stateIndex-1];
        var lastStateOfSet = states[stateIndex-2];

        var summary = new SetSummary();
        summary.CompletedAt = firstStateOfNextSet.CreatedAtDateTime.ToUniversalTime().ToString("o");

        // Determine winner of this set
        if (firstStateOfNextSet.Score.P1Sets > lastStateOfSet.Score.P1Sets)
        {
            summary.Winner = matchEntity.ParticipantOne.Name;
        }
        else
        {
            summary.Winner = matchEntity.ParticipantTwo.Name;
        }

        var p1SetSummary = new ParticipantSetSummary();
        var p2SetSummary = new ParticipantSetSummary();

        // Games
        p1SetSummary.Games = lastStateOfSet.Score.P1Games;
        p2SetSummary.Games = lastStateOfSet.Score.P2Games;
        if (summary.Winner == matchEntity.ParticipantOne.Name)
        {
            p1SetSummary.Games++;
        }
        else
        {
            p2SetSummary.Games++;
        }

        // Tiebreak
        if (Scorer.IsTiebreak(matchEntity.Format, lastStateOfSet))
        {
            summary.Tiebreak = true;
            p1SetSummary.TiebreakPoints = lastStateOfSet.Score.P1Points;
            p2SetSummary.TiebreakPoints = lastStateOfSet.Score.P2Points;
            if (summary.Winner == matchEntity.ParticipantOne.Name)
            {
                p1SetSummary.TiebreakPoints++;
            }
            else
            {
                p2SetSummary.TiebreakPoints++;
            }
        }

        summary.Score.Add(matchEntity.ParticipantOne.Name, p1SetSummary);
        summary.Score.Add(matchEntity.ParticipantTwo.Name, p2SetSummary);
        
        return summary;
    }
}