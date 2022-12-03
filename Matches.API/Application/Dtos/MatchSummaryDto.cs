#nullable enable

using System;
using System.Collections.Generic;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Dtos;

public class MatchSummaryDto
{
    public DateTime CompletedDateTime { get; private set; }
    public string Winner { get; set; }
    public IDictionary<int, SetSummaryDto> Sets { get; private set; }


    public MatchSummaryDto(DateTime completedDateTime, string winner, IDictionary<int, SetSummaryDto> sets)
    {
        CompletedDateTime = completedDateTime;
        Winner = winner;
        Sets = sets;
    }

    public static MatchSummaryDto ConvertToDto(Match match, MatchSummary summary)
    {
        var sets = new Dictionary<int, SetSummaryDto>();
        foreach (var set in summary.Sets)
        {
            sets.Add(set.Set, SetSummaryDto.ConvertToDto(match, set));
        }

        return new MatchSummaryDto(
            summary.CompletedDateTime,
            summary.Winner == Participant.One ? match.ParticipantOne : match.ParticipantTwo,
            sets
        );
    }
}
