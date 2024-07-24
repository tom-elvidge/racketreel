using FluentValidation;

namespace Matches.Application.Commands.DeleteMatch;

internal class DeleteMatchCommandValidator : AbstractValidator<DeleteMatchCommand>
{
    public DeleteMatchCommandValidator()
    {
        RuleFor(c => c.MatchId)
            .NotNull()
            .WithMessage($"{nameof(DeleteMatchCommand.MatchId)} cannot be null.");
        
        RuleFor(c => c.UserId)
            .NotNull()
            .WithMessage($"{nameof(DeleteMatchCommand.UserId)} cannot be null.");
    }
}