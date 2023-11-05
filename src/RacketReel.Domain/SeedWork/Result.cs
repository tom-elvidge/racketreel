namespace RacketReel.Domain.SeedWork;

public class Result
{
    public bool IsSuccess { get; private set; }

    public Error Error { get; private set; }

    public bool IsFailure => !IsSuccess;

    public Result(bool isSuccess, Error error)
    {
        if (isSuccess && error.Code != "")
            throw new ArgumentException("cannot be a success and have an error");
        if (!isSuccess && error.Code == "")
            throw new ArgumentException("cannot be a failure and have no error");
        IsSuccess = isSuccess;
        Error = error;
    }

    public static Result Failure(Error error)
    {
        return new Result(false, error);
    }

    public static Result<T> Failure<T>(Error error)
    {
        return new Result<T>(false, error, default(T));
    }

    public static Result Success()
    {
        return new Result(true, Error.None());
    }

    public static Result<T> Success<T>(T value)
    {
        return new Result<T>(true, Error.None(), value);
    }
}