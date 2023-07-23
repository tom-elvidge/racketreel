using FluentValidation;

namespace RacketReel.Application.Commands.CreateMatch;

internal class CreateMatchCommandValidator : AbstractValidator<CreateMatchCommand>
{
    public CreateMatchCommandValidator()
    {
        RuleFor(c => c.Participants)
            .NotNull()
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.Participants)} cannot be null or empty.");

        RuleFor(c => c.Participants)
            .Must(p => p.ToList().Count() == 2)
            .WithMessage($"{nameof(CreateMatchCommand.Participants)} must have exactly two players.");

        RuleFor(c => c.ServingFirst)
            .NotNull()
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.ServingFirst)} cannot be null or empty.");

        RuleFor(c => c.ServingFirst)
            .Must((c, servingFirst) => c.Participants.Contains(servingFirst))
            .WithMessage($"{nameof(CreateMatchCommand.ServingFirst)} must be one of the players.");
    }
}