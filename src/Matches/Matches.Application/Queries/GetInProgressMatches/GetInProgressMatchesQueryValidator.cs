using FluentValidation;

namespace Matches.Application.Queries.GetInProgressMatches;

internal class GetInProgressMatchesQueryValidator : AbstractValidator<GetInProgressMatchesQuery>
{
    public GetInProgressMatchesQueryValidator()
    {
        RuleFor(c => c.PageNumber)
            .NotNull()
            .WithMessage($"{nameof(GetInProgressMatchesQuery.PageNumber)} cannot be null.");

        RuleFor(c => c.PageNumber)
            .GreaterThan(0)
            .WithMessage($"{nameof(GetInProgressMatchesQuery.PageNumber)} must be greater than zero.");

        RuleFor(c => c.PageSize)
            .NotNull()
            .WithMessage($"{nameof(GetInProgressMatchesQuery.PageSize)} cannot be null.");
        
        RuleFor(c => c.PageSize)
            .GreaterThan(0)
            .WithMessage($"{nameof(GetInProgressMatchesQuery.PageSize)} must be greater than zero.");

        RuleFor(c => c.PageSize)
            .LessThanOrEqualTo(20)
            .WithMessage($"{nameof(GetInProgressMatchesQuery.PageSize)} must be less than or equal to 20.");
    }
}