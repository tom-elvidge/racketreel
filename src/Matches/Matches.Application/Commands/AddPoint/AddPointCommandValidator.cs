using FluentValidation;

namespace Matches.Application.Commands.AddPoint;

internal class AddPointCommandValidator : AbstractValidator<AddPointCommand>
{
    public AddPointCommandValidator()
    {
        RuleFor(c => c.MatchId)
            .NotNull()
            .WithMessage($"{nameof(AddPointCommand.MatchId)} cannot be null.");
        
        RuleFor(c => c.Team)
            .NotNull()
            .WithMessage($"{nameof(AddPointCommand.Team)} cannot be null.");
    }
}