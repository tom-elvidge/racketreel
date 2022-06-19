using System.Threading;
using System.Threading.Tasks;
using FluentValidation;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Commands.DeleteLatestMatchState;

public class DeleteLatestMatchStateValidator : AbstractValidator<DeleteLatestMatchStateCommand>
{

    private readonly IMatchRepository _matchRepository;

    public DeleteLatestMatchStateValidator(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository;

        RuleFor(c => c.MatchId)
            .NotEmpty().WithMessage($"{nameof(DeleteLatestMatchStateCommand.MatchId)} is required")
            .MustAsync(MatchIdExistsAsync).WithMessage("There is no match with this id");
    }

    public async Task<bool> MatchIdExistsAsync(int matchId, CancellationToken cancellationToken)
    {
        var match = await _matchRepository.GetAsync(matchId);
        return match == null ? false : true;
    }
}
