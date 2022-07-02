#nullable disable

using System;

namespace RacketReel.Services.Matches.API.Application.Exceptions;

public class DeleteInitialStateException : Exception
{
    public DeleteInitialStateException()
        : base()
    {}

    public DeleteInitialStateException(string message)
        : base(message)
    {
    }

    public DeleteInitialStateException(string message, Exception innerException)
        : base(message, innerException)
    {
    }

    public DeleteInitialStateException(int matchId)
        : base($"Match with id {matchId} only contains the initial state which cannot be deleted.")
    {
    }
}
