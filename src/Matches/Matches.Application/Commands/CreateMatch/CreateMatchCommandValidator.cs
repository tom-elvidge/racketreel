using FluentValidation;

namespace Matches.Application.Commands.CreateMatch;

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
    }
}