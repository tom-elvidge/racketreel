namespace RacketReel.Application.Common;

public record Result(bool IsSuccess, Error Error)
{
    public bool IsFailure => !IsSuccess;
    
    public static Result Failure(Error error)
    {
        return new Result(false, error);
    }

    public static Result<T> Failure<T>(Error error)
    {
        return new Result<T>(false, error, default!);
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

public record Result<T>(bool IsSuccess, Error Error, T Value) : Result(IsSuccess, Error);