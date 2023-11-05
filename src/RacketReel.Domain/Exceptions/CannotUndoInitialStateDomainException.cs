namespace RacketReel.Domain.Exceptions;

public class CannotUndoInitialStateDomainException : DomainException
{
    public CannotUndoInitialStateDomainException()
    { }

    public CannotUndoInitialStateDomainException(string message)
        : base(message)
    { }

    public CannotUndoInitialStateDomainException(string message, Exception innerException)
        : base(message, innerException)
    { }
}
