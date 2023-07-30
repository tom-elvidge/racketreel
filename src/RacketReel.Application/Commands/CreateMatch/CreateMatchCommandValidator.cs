using FluentValidation;

namespace RacketReel.Application.Commands.CreateMatch;

internal class CreateMatchCommandValidator : AbstractValidator<CreateMatchCommand>
{
    public CreateMatchCommandValidator()
    {
        RuleFor(c => c.TeamOneName)
            .NotNull()
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.TeamOneName)} cannot be null or empty.");

        RuleFor(c => c.TeamTwoName)
            .NotNull()
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.TeamTwoName)} cannot be null or empty.");

        RuleFor(c => c.ServingFirst)
            .NotNull()
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.ServingFirst)} cannot be null or empty.");

        RuleFor(c => c.Format)
            .NotNull()
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.Format)} cannot be null or empty.");
    }
}