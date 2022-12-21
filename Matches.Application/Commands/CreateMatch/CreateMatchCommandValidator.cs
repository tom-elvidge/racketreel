using FluentValidation;

namespace Matches.Application.Commands.CreateMatch;

internal class CreateMatchCommandValidator : AbstractValidator<CreateMatchCommand>
{
    public CreateMatchCommandValidator()
    {
        RuleFor(c => c.Players)
            .NotNull()
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.Players)} cannot be null or empty.");

        RuleFor(c => c.Players)
            .Must(p => p.ToList().Count() == 2)
            .WithMessage($"{nameof(CreateMatchCommand.Players)} must have exactly two players.");

        RuleFor(c => c.ServingFirst)
            .NotNull()
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.ServingFirst)} cannot be null or empty.");

        RuleFor(c => c.ServingFirst)
            .Must((c, servingFirst) => c.Players.Contains(servingFirst))
            .WithMessage($"{nameof(CreateMatchCommand.ServingFirst)} must be one of the players.");
    }
}