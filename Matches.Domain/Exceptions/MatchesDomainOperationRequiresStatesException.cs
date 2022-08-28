using System;

namespace RacketReel.Services.Matches.Domain.Exceptions;

public class MatchesDomainOperationRequiresStatesException : MatchesDomainException
{
    public MatchesDomainOperationRequiresStatesException()
    { }

    public MatchesDomainOperationRequiresStatesException(string message)
        : base(message)
    { }

    public MatchesDomainOperationRequiresStatesException(string message, Exception innerException)
        : base(message, innerException)
    { }
}
