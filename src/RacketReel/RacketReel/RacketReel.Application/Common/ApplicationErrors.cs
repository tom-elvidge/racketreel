namespace RacketReel.Application.Common;

public static class ApplicationErrors
{
    public static readonly Error NotFound = new Error("NotFound", "The requested resource cannot be found");

    public static readonly Error Unauthorized = new Error("Unauthorized", "The user is not authorized to take this action");
    
    public static readonly Error ServerError = new Error("ServerError", "Unexpected error handling request");
}