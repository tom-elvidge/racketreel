using FluentValidation;

namespace RacketReel.Application.Commands.DeleteLatestState;

internal class DeleteLatestStateCommandValidator : AbstractValidator<DeleteLatestStateCommand>
{
    public DeleteLatestStateCommandValidator()
    {
        RuleFor(c => c.MatchId)
            .NotNull()
            .WithMessage($"{nameof(DeleteLatestStateCommand.MatchId)} cannot be null.");
    }
}