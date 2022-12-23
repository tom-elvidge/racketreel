using Matches.Domain.SeedWork;

namespace Matches.Application.Errors;

public static class ApplicationErrors
{
    public static readonly Error NotFound = new Error("NotFound", "The requested resource cannot be found.");
    
    public static readonly Error UpdateCompletedMatch = new Error("UpdateCompletedMatch", "A completed match cannot be updated with a new state.");

    public static readonly Error DeleteInitialState = new Error("DeleteInitialState", "The initial state cannot be deleted.");
}