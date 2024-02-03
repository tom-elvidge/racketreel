using Grpc.Core;

namespace Matches.Presentation;

public static class ServerCallContextExtensions
{
    public static string GetUserId(this ServerCallContext context)
    {
        var userIdClaim = context
            .GetHttpContext()
            .User
            .Claims
            .FirstOrDefault(c => c.Type.Equals("user_id"));

        if (userIdClaim == null)
            throw new ApplicationException("Request with no 'user_id' claim bypassed authorization middleware");

        return userIdClaim.Value;
    }
}