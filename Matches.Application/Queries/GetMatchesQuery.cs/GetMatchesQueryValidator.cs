using FluentValidation;

namespace Matches.Application.Queries.GetMatchesQuery;

internal class GetMatchesQueryValidator : AbstractValidator<GetMatchesQuery>
{
    public GetMatchesQueryValidator()
    {
        RuleFor(c => c.PageNumber)
            .NotNull()
            .WithMessage($"{nameof(GetMatchesQuery.PageNumber)} cannot be null.");

        RuleFor(c => c.PageNumber)
            .GreaterThan(0)
            .WithMessage($"{nameof(GetMatchesQuery.PageNumber)} must be greater than zero.");

        RuleFor(c => c.PageSize)
            .NotNull()
            .WithMessage($"{nameof(GetMatchesQuery.PageSize)} cannot be null.");
        
        RuleFor(c => c.PageSize)
            .GreaterThan(0)
            .WithMessage($"{nameof(GetMatchesQuery.PageSize)} must be greater than zero.");

        RuleFor(c => c.PageSize)
            .LessThanOrEqualTo(20)
            .WithMessage($"{nameof(GetMatchesQuery.PageSize)} must be less than or equal to 20.");

        RuleFor(c => c.OrderBy)
            .NotNull()
            .WithMessage($"{nameof(GetMatchesQuery.OrderBy)} cannot be null.");
    }
}