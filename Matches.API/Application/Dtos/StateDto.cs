#nullable disable

using System;
using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Dtos;

#nullable enable

public class StateDto
{
    public DateTime CreatedDateTime { get; private set; }
    public string Serving { get; private set; }
    public IDictionary<string, PlayerScoreDto> Score { get; private set; }
    public bool IsTieBreak { get; private set; }

    public StateDto(DateTime createdDateTime, string serving, IDictionary<string, PlayerScoreDto> score, bool isTieBreak)
    {
        CreatedDateTime = createdDateTime;
        Serving = serving;
        Score = score;
        IsTieBreak = isTieBreak;
    }

    public static StateDto ConvertToDto(Match match, State state)
    {
        return new StateDto(
            state.CreatedDateTime,
            state.Serving == Participant.One ? match.ParticipantOne : match.ParticipantTwo,
            new Dictionary<string, PlayerScoreDto>()
            {
                { match.ParticipantOne, new PlayerScoreDto(state.Score.ParticipantOnePoints, state.Score.ParticipantOneGames, state.Score.ParticipantOneSets) },
                { match.ParticipantTwo, new PlayerScoreDto(state.Score.ParticipantTwoPoints, state.Score.ParticipantTwoGames, state.Score.ParticipantTwoSets) }
            },
            state.IsTieBreak
        );
    }
}