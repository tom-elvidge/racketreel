using FluentValidation;

namespace RacketReel.Application.Commands.UpdateLatestState;

internal class UpdateLatestStateCommandValidator : AbstractValidator<UpdateLatestStateCommand>
{
    public UpdateLatestStateCommandValidator()
    {
        RuleFor(c => c.MatchId)
            .NotNull()
            .WithMessage($"{nameof(UpdateLatestStateCommand.MatchId)} cannot be null.");

        RuleFor(c => c.Highlight)
            .NotNull()
            .WithMessage($"{nameof(UpdateLatestStateCommand.Highlight)} cannot be null.");
    }
}