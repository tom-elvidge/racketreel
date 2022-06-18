using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using FluentValidation;
using RacketReel.Services.Matches.API.Application.Commands;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Validators;

public class NewMatchStateValidator : AbstractValidator<NewMatchStateCommand>
{

    private readonly IMatchRepository _matchRepository;

    public NewMatchStateValidator(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository;

        RuleFor(c => c.MatchId)
            .NotEmpty().WithMessage($"{nameof(NewMatchStateCommand.MatchId)} is required")
            .MustAsync(MatchIdExists).WithMessage("There is no match with this id");

        RuleFor(c => c.PointTo)
            .NotEmpty().WithMessage($"{nameof(NewMatchStateCommand.PointTo)} is required");

        RuleFor(c => c.PointTo)
            .MustAsync(async (c, pointTo, cancellation) => await PlayerInMatch(pointTo, c.MatchId, cancellation))
            .WithMessage($"{nameof(NewMatchStateCommand.PointTo)} must be a player in the match");
    }

    public async Task<bool> MatchIdExists(int matchId, CancellationToken cancellationToken)
    {
        var match = await _matchRepository.GetAsync(matchId);
        return match == null ? false : true;
    }

    public async Task<bool> PlayerInMatch(string player, int matchId, CancellationToken cancellationToken)
    {
        var match = await _matchRepository.GetAsync(matchId);
        if (match == null) return false;

        var players = new List<string>() { match.ParticipantOne, match.ParticipantTwo };
        return players.Contains(player);
    }
}
