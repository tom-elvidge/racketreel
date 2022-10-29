#nullable enable

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
    // nullable as cannot determine if we don't have states
    public string? ServingFirst { get; private set; }
    public int Sets { get; private set; }
    public string SetType { get; private set; }
    public string FinalSetType { get; private set; }
    public bool Complete { get; private set; }
    // nullable as can send match without states to save bandwidth
    public IEnumerable<StateDto>? States { get; private set; }

    public MatchDto(int id, DateTime createdDateTime, IEnumerable<string> players, string? servingFirst, int sets, string setType, string finalSetType, bool complete, IEnumerable<StateDto>? states)
    {
        Id = id;
        CreatedDateTime = createdDateTime;
        Players = players;
        ServingFirst = servingFirst;
        Sets = sets;
        SetType = setType;
        FinalSetType = finalSetType;
        Complete = complete;
        States = states;
    }

    public static MatchDto ConvertToDto(Match match)
    {
        return new MatchDto(
            match.Id,
            match.CreatedDateTime,
            new List<string>() { match.ParticipantOne, match.ParticipantTwo },
            match.States == null ? null : match.States.OrderBy(s => s.CreatedDateTime).First().Serving == 0 ? match.ParticipantOne : match.ParticipantTwo,
            match.Format.Sets,
            match.Format.NormalSetType.ToString(),
            match.Format.FinalSetType.ToString(),
            match.Complete,
            match.States == null ? null : match.States.Select(s => StateDto.ConvertToDto(match, s))
        );
    }
}
