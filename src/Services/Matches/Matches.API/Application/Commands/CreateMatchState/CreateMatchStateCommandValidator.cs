using FluentValidation;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Commands.CreateMatchState;

public class CreateMatchStateCommandValidator : AbstractValidator<CreateMatchStateCommand>
{
    private readonly IMatchRepository _matchRepository;

    public CreateMatchStateCommandValidator(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository;

        RuleFor(c => c.PointTo)
            .NotEmpty().WithMessage($"{nameof(CreateMatchStateCommand.PointTo)} is required");

        // RuleFor(c => c.PointTo)
        //     .MustAsync(async (command, pointTo, cancellation) => await IsPlayerInMatchAsync(pointTo, command.MatchId, cancellation))
        //     .WithMessage($"{nameof(NewMatchStateCommand.PointTo)} must be participating in the match");
    }

    // Todo: Fix async validations error
    // public async Task<bool> IsPlayerInMatchAsync(string player, int matchId, CancellationToken cancellationToken)
    // {
    //     var match = await _matchRepository.GetAsync(matchId);
    //     if (match == null) return false;

    //     var players = new List<string>() { match.ParticipantOne, match.ParticipantTwo };
    //     return players.Contains(player);
    // }
}
