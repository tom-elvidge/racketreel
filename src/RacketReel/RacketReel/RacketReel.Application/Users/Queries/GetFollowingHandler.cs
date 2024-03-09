using Microsoft.Extensions.Logging;
using RacketReel.Application.Common;
using RacketReel.Domain.Users;

namespace RacketReel.Application.Users.Queries;

public sealed record GetFollowingQuery(UserId UserId) : IQuery<List<UserInfoEntity>>;

public sealed class GetFollowingHandler(
    ILogger<GetFollowingHandler> logger,
    IUserInfoRepository userInfoRepository,
    IFollowerRepository followerRepository) : IQueryHandler<GetFollowingQuery, List<UserInfoEntity>>
{
    public Task<Result<List<UserInfoEntity>>> Handle(GetFollowingQuery request, CancellationToken cancellationToken)
    {
        try
        {
            var followerEntities = followerRepository.GetFollowerEntitiesByFollowerUserId(request.UserId);

            var followingUserIds = followerEntities.Select(f => f.UserId);
            
            var userInfoEntities = userInfoRepository.GetUserInfoEntities(followingUserIds);

            return Task.FromResult(Result.Success(userInfoEntities.ToList()));
        }
        catch (Exception e)
        {
            logger.LogWarning(e, "Unexpected exception handling request");

            return Task.FromResult(Result.Failure<List<UserInfoEntity>>(ApplicationErrors.ServerError));
        }
    }
}