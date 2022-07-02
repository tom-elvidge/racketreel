#nullable disable

using System;
using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Dtos;

#nullable restore

public class StateDto
{
    public DateTime CreatedDateTime { get; private set; }
    public string Serving { get; private set; }
    public IDictionary<string, PlayerScoreDto> Score { get; private set; }
    public bool IsTieBreak { get; private set; }

    // Optional tie break fields
    public int? TieBreakPointCounter { get; private set; }
    public string? ServingAfterTieBreak { get; private set; }

    public StateDto(DateTime createdDateTime, string serving, IDictionary<string, PlayerScoreDto> score, bool isTieBreak, int? tieBreakPointCounter, string? servingAfterTieBreak)
    {
        CreatedDateTime = createdDateTime;
        Serving = serving;
        Score = score;
        IsTieBreak = isTieBreak;
        TieBreakPointCounter = tieBreakPointCounter;
        ServingAfterTieBreak = servingAfterTieBreak;
    }

    public static StateDto ConvertToDto(Match match, State state)
    {
        return new StateDto(
            state.CreatedDateTime,
            state.Serving == 0 ? match.ParticipantOne : match.ParticipantTwo,
            new Dictionary<string, PlayerScoreDto>()
            {
                { match.ParticipantOne, new PlayerScoreDto(state.Score.ParticipantOnePoints, state.Score.ParticipantOneGames, state.Score.ParticipantOneSets) },
                { match.ParticipantTwo, new PlayerScoreDto(state.Score.ParticipantTwoPoints, state.Score.ParticipantTwoGames, state.Score.ParticipantOneSets) }
            },
            state.IsTieBreak,
            state.TieBreakPointCounter == 0 ? null : state.TieBreakPointCounter,
            state.ServingAfterTieBreak == -1 ? null : (state.ServingAfterTieBreak == 0 ? match.ParticipantOne : match.ParticipantTwo)
        );
    }
}
