using FluentValidation;

namespace RacketReel.Application.Commands.CreateState;

internal class CreateStateCommandValidator : AbstractValidator<CreateStateCommand>
{
    public CreateStateCommandValidator()
    {
        RuleFor(c => c.MatchId)
            .NotNull()
            .WithMessage($"{nameof(CreateStateCommand.MatchId)} cannot be null.");

        RuleFor(c => c.Participant)
            .NotNull()
            .NotEmpty()
            .WithMessage($"{nameof(CreateStateCommand.Participant)} cannot be null or empty.");
    }
}