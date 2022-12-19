namespace Matches.Domain.Exceptions;

public class CannotUpdateACompletedMatchDomainException : DomainException
{
    public CannotUpdateACompletedMatchDomainException()
    { }

    public CannotUpdateACompletedMatchDomainException(string message)
        : base(message)
    { }

    public CannotUpdateACompletedMatchDomainException(string message, Exception innerException)
        : base(message, innerException)
    { }
}
