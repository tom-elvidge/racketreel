namespace Matches.Domain.SeedWork;

public class ValidationResult<TValue> : Result<TValue>, IValidationResult
{
    public ValidationResult(Error[] errors)
        : base(false, IValidationResult.ValidationError, default(TValue))
    {
        Errors = errors;
    }

    public Error[] Errors { get; }

    public static ValidationResult<TValue> WithErrors(Error[] errors)
    {
        return new ValidationResult<TValue>(errors);
    }
}