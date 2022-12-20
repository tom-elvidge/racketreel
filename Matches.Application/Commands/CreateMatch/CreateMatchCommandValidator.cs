using FluentValidation;

namespace Matches.Application.Commands.CreateMatch;

internal class CreateMatchCommandValidator : AbstractValidator<CreateMatchCommand>
{
    public CreateMatchCommandValidator()
    {
        RuleFor(c => c.Players)
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.Players)} is required");

        RuleFor(c => c.Players)
            .Must(p => p.ToList().Count() == 2)
            .WithMessage($"{nameof(CreateMatchCommand.Players)} must have exactly two players");

        RuleFor(c => c.ServingFirst)
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.ServingFirst)} is required");

        RuleFor(c => c.ServingFirst)
            .Must((c, servingFirst) => c.Players.Contains(servingFirst))
            .WithMessage($"{nameof(CreateMatchCommand.ServingFirst)} must be one of the players");
    }
}