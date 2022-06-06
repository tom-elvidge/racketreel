using System;
using System.Collections.Generic;
using System.Linq;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Dtos;

public class MatchDto
{
    public int Id { get; private set; }
    public DateTime CreatedDateTime { get; private set; }
    public IEnumerable<string> Players { get; private set; }
    public string ServingFirst { get; private set; }
    public int Sets { get; private set; }
    public string SetType { get; private set; }
    public string FinalSetType { get; private set; }
    public IEnumerable<StateDto> States { get; private set; }

    public MatchDto(int id, DateTime createdDateTime, IEnumerable<string> players, string servingFirst, int sets, string setType, string finalSetType, IEnumerable<StateDto> states)
    {
        Id = id;
        CreatedDateTime = createdDateTime;
        Players = players;
        ServingFirst = servingFirst;
        Sets = sets;
        SetType = setType;
        FinalSetType = finalSetType;
        States = states;
    }

    public static MatchDto ConvertToDto(Match match)
    {
        return new MatchDto(
            match.Id,
            match.CreatedDateTime,
            new List<string>() { match.ParticipantOne, match.ParticipantTwo },
            match.States.OrderBy(s => s.CreatedDateTime).First().Serving == 0 ? match.ParticipantOne : match.ParticipantTwo,
            match.Format.Sets,
            match.Format.NormalSetType.ToString(),
            match.Format.FinalSetType.ToString(),
            match.States.Select(s => new StateDto(
                s.CreatedDateTime,
                s.Serving == 0 ? match.ParticipantOne : match.ParticipantTwo,
                new Dictionary<string, PlayerScoreDto>()
                {
                    { match.ParticipantOne, new PlayerScoreDto(s.Score.ParticipantOnePoints, s.Score.ParticipantOneGames, s.Score.ParticipantOneSets) },
                    { match.ParticipantTwo, new PlayerScoreDto(s.Score.ParticipantTwoPoints, s.Score.ParticipantTwoGames, s.Score.ParticipantOneSets) }
                },
                s.IsTieBreak,
                s.TieBreakPointCounter == 0 ? null : s.TieBreakPointCounter,
                s.ServingAfterTieBreak == -1 ? null : (s.ServingAfterTieBreak == 0 ? match.ParticipantOne : match.ParticipantTwo)
            ))
        );
    }
}
