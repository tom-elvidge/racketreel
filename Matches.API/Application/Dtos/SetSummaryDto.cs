#nullable enable

using System;
using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Dtos;

public class SetSummaryDto
{
    public DateTime CompletedDateTime { get; private set; }
    public string Winner { get; private set; }
    public bool TieBreak { get; private set; }
    public IDictionary<string, SetScoreDto> Score { get; private set; }


    public SetSummaryDto(DateTime completedDateTime, string winner, bool tieBreak, IDictionary<string, SetScoreDto> score)
    {
        CompletedDateTime = completedDateTime;
        Winner = winner;
        TieBreak = tieBreak;
        Score = score;
    }

    public static SetSummaryDto ConvertToDto(Match match, SetSummary setSummary)
    {
        return new SetSummaryDto(
            setSummary.CompletedDateTime,
            setSummary.Winner == Participant.One ? match.ParticipantOne : match.ParticipantTwo,
            setSummary.TieBreak,
            new Dictionary<string, SetScoreDto>()
            {
                { match.ParticipantOne, new SetScoreDto(setSummary.ParticipantOneGames, setSummary.ParticipantOneTieBreakPoints) },
                { match.ParticipantTwo, new SetScoreDto(setSummary.ParticipantTwoGames, setSummary.ParticipantTwoTieBreakPoints) },
            }
        );
    }
}
