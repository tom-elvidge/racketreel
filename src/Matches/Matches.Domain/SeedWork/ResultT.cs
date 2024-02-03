namespace Matches.Domain.SeedWork;

public class Result<T> : Result
{
    public T Value { get; private set; }

    public Result(bool isSuccess, Error error, T value) : base(isSuccess, error)
    {
        Value = value;
    }
}