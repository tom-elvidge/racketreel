#nullable disable

using System;

namespace RacketReel.Services.Matches.API.Application.Exceptions;

public class UpdateInitialStateException : Exception
{
    public UpdateInitialStateException()
        : base()
    {}

    public UpdateInitialStateException(string message)
        : base(message)
    {
    }

    public UpdateInitialStateException(string message, Exception innerException)
        : base(message, innerException)
    {
    }

    public UpdateInitialStateException(int matchId)
        : base($"Match with id {matchId} only contains the initial state which cannot be updated.")
    {
    }
}
