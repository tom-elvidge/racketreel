using FluentValidation;
using RacketReel.Services.Matches.API.Application.Commands;

namespace RacketReel.Services.Matches.API.Application.Validators;

public class CreateMatchCommandValidator : AbstractValidator<CreateMatchCommand>
{
    public CreateMatchCommandValidator()
    {
        // Todo: Validate command
        // RuleFor(c => c.Players).NotEmpty();
    }
}
