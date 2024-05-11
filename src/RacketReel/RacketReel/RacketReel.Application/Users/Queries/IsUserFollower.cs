using Microsoft.Extensions.Logging;
using RacketReel.Application.Common;
using RacketReel.Domain.Users;

namespace RacketReel.Application.Users.Queries;

public sealed record IsUserFollowerQuery(UserId UserId, UserId FollowerUserId) : IQuery<bool>;

public sealed class IsUserFollowerHandler(
    ILogger<IsUserFollowerHandler> logger,
    IFollowerRepository followerRepository) : IQueryHandler<IsUserFollowerQuery, bool>
{
    public Task<Result<bool>> Handle(IsUserFollowerQuery request, CancellationToken cancellationToken)
    {
        try
        {
            var followerEntity = followerRepository.GetFollowerEntity(request.UserId, request.FollowerUserId);

            return Task.FromResult(Result.Success(followerEntity != null));
        }
        catch (Exception e)
        {
            logger.LogWarning(e, "Unexpected exception handling request");

            return Task.FromResult(Result.Failure<bool>(ApplicationErrors.ServerError));
        }
    }
}