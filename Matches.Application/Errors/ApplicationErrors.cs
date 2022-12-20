using Matches.Domain.SeedWork;

namespace Matches.Application.Errors;

public static class ApplicationErrors
{
    public static readonly Error NotFound = new Error("NotFound", "The requested resource cannot be found.");
}