using System;
using System.Linq;
using FluentValidation;
using RacketReel.Services.Matches.API.Application.Commands;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Validators;

public class CreateMatchCommandValidator : AbstractValidator<CreateMatchCommand>
{
    public CreateMatchCommandValidator()
    {
        // Todo: Respond with 400 Bad Request and error messages if any validations fail

        // Set type
        RuleFor(c => c.SetType)
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.SetType)} is required");

        RuleFor(c => c.SetType)
            .Must(s => Enum.TryParse<SetType>(s, out _))
            .WithMessage($"{nameof(CreateMatchCommand.SetType)} must be one of the following: " + string.Join(", ", Enum.GetNames(typeof(SetType))));

        // Final set type
        RuleFor(x => x.FinalSetType)
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.FinalSetType)} is required");

        RuleFor(c => c.FinalSetType)
            .Must(s => Enum.TryParse<SetType>(s, out _))
            .WithMessage($"{nameof(CreateMatchCommand.SetType)} must be one of the following: " + string.Join(", ", Enum.GetNames(typeof(SetType))));
        
        // Players
        RuleFor(c => c.Players)
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.Players)} is required");

        RuleFor(c => c.Players)
            .Must(p => p.ToList().Count() == 2)
            .WithMessage($"{nameof(CreateMatchCommand.Players)} must have exactly two players");
        
        // Sets
        RuleFor(c => c.Sets)
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.Sets)} is required");

        RuleFor(c => c.Sets)
            .GreaterThan(0)
            .LessThanOrEqualTo(5)
            .Must(s => s % 2 != 0)
            .WithMessage($"{nameof(CreateMatchCommand.Sets)} must be an odd number between 1 and 5");

        // Serving first
        RuleFor(c => c.ServingFirst)
            .NotEmpty()
            .WithMessage($"{nameof(CreateMatchCommand.ServingFirst)} is required");
            
        RuleFor(c => c.ServingFirst)
            .Must((c, s) => c.Players.Contains(s))
            .WithMessage($"{nameof(CreateMatchCommand.ServingFirst)} must be one of the players");
    }
}
