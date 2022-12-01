using FluentValidation;

namespace RacketReel.Services.Matches.API.Application.Commands.CreateMatch;

public class UpdateMatchStateCommandValidator : AbstractValidator<UpdateMatchStateCommand>
{
    public UpdateMatchStateCommandValidator()
    {
        RuleFor(c => c.Highlight)
            .NotNull().WithMessage($"{nameof(UpdateMatchStateCommand.Highlight)} is required");
        RuleFor(c => c.StateIndex)
            .NotEqual(0).WithMessage("Cannot update the initial state");
    }
}