using System;

namespace RacketReel.Services.Matches.Domain.Exceptions;

public class MatchesDomainException : Exception
{
    public MatchesDomainException()
    { }

    public MatchesDomainException(string message)
        : base(message)
    { }

    public MatchesDomainException(string message, Exception innerException)
        : base(message, innerException)
    { }
}
