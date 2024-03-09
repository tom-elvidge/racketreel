using Microsoft.Extensions.Logging;
using RacketReel.Application.Common;
using RacketReel.Domain.Users;

namespace RacketReel.Application.Users.Queries;

public sealed record GetFollowersQuery(UserId UserId) : IQuery<List<UserInfoEntity>>;

public sealed class GetFollowersHandler(
    ILogger<GetFollowersHandler> logger,
    IUserInfoRepository userInfoRepository,
    IFollowerRepository followerRepository) : IQueryHandler<GetFollowersQuery, List<UserInfoEntity>>
{
    public Task<Result<List<UserInfoEntity>>> Handle(GetFollowersQuery request, CancellationToken cancellationToken)
    {
        try
        {
            var followerEntities = followerRepository.GetFollowerEntities(request.UserId);

            var followerUserIds = followerEntities.Select(f => f.FollowerUserId);
            
            var userInfoEntities = userInfoRepository.GetUserInfoEntities(followerUserIds);

            return Task.FromResult(Result.Success(userInfoEntities.ToList()));
        }
        catch (Exception e)
        {
            logger.LogWarning(e, "Unexpected exception handling request");

            return Task.FromResult(Result.Failure<List<UserInfoEntity>>(ApplicationErrors.ServerError));
        }
    }
}