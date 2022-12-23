using FluentValidation;

namespace Matches.Application.Commands.UpdateState;

internal class UpdateStateCommandValidator : AbstractValidator<UpdateStateCommand>
{
    public UpdateStateCommandValidator()
    {
        RuleFor(c => c.MatchId)
            .NotNull()
            .WithMessage($"{nameof(UpdateStateCommand.MatchId)} cannot be null.");

        RuleFor(c => c.StateIndex)
            .NotNull()
            .WithMessage($"{nameof(UpdateStateCommand.StateIndex)} cannot be null.");

        RuleFor(c => c.Highlight)
            .NotNull()
            .WithMessage($"{nameof(UpdateStateCommand.Highlight)} cannot be null.");
    }
}