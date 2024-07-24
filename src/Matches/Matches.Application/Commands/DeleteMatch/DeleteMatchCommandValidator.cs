using FluentValidation;

namespace Matches.Application.Commands.ToggleHighlight;

internal class ToggleHighlightCommandValidator : AbstractValidator<ToggleHighlightCommand>
{
    public ToggleHighlightCommandValidator()
    {
        RuleFor(c => c.MatchId)
            .NotNull()
            .WithMessage($"{nameof(ToggleHighlightCommand.MatchId)} cannot be null.");
    }
}