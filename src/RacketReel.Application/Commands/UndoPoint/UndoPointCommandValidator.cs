using FluentValidation;

namespace RacketReel.Application.Commands.UndoPoint;

internal class UndoPointCommandValidator : AbstractValidator<UndoPointCommand>
{
    public UndoPointCommandValidator()
    {
        RuleFor(c => c.MatchId)
            .NotNull()
            .WithMessage($"{nameof(UndoPointCommand.MatchId)} cannot be null.");
    }
}