using Matches.Application.Models;
using Matches.Application.Models.Match;
using Matches.Domain;
using Matches.Domain.AggregatesModel.MatchAggregate;

namespace Matches.Application.Services;

public class StateCreator
{
    public static State CreateState(MatchEntity matchEntity, StateEntity stateEntity)
    {
        return new State(
            MatchId: matchEntity.Id,
            StateId: stateEntity.Id,
            Version: stateEntity.Version, 
            CreatedAtUtc: stateEntity.CreatedAtDateTime, 
            Highlighted: stateEntity.Highlight,
            Tiebreak: Scorer.IsTiebreak(matchEntity.Format, stateEntity),
            Serving: stateEntity.Serving == ParticipantEnum.One ? Team.TeamOne : Team.TeamTwo,
            TeamOneGames: stateEntity.Score.P1Games, 
            TeamOnePoints: stateEntity.Score.P1Points, 
            TeamOneSets: stateEntity.Score.P1Sets, 
            TeamTwoGames: stateEntity.Score.P2Games, 
            TeamTwoPoints: stateEntity.Score.P2Points, 
            TeamTwoSets: stateEntity.Score.P2Sets,
            Completed: matchEntity.IsComplete());
    }
}