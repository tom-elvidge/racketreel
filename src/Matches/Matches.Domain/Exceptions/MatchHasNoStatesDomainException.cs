namespace Matches.Domain.Exceptions;

public class MatchHasNoStatesDomainException : DomainException
{
    public MatchHasNoStatesDomainException()
    { }

    public MatchHasNoStatesDomainException(string message)
        : base(message)
    { }

    public MatchHasNoStatesDomainException(string message, Exception innerException)
        : base(message, innerException)
    { }
}
