using Matches.Domain.SeedWork;

namespace Matches.Application.Errors;

public static class ApplicationErrors
{
    public static readonly Error NotFound = new Error("NotFound", "The requested resource cannot be found.");

    public static readonly Error UpdateCompletedMatch = new Error("UpdateCompletedMatch", "A completed match cannot be updated with a new state.");

    public static readonly Error DeleteInitialState = new Error("DeleteInitialState", "The initial state cannot be deleted.");
    
    public static readonly Error NotComplete = new Error("NotComplete", "The match is not yet complete.");
    
    public static readonly Error Unauthorized = new Error("Unauthorized", "The user is not authorized to take this action.");
    
    public static readonly Error Unknown = new Error("Unknown", "Something unexpected went wrong.");
}