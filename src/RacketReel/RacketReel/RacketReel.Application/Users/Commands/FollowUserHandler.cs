using Microsoft.Extensions.Logging;
using RacketReel.Application.Common;
using RacketReel.Domain.Followers;
using RacketReel.Domain.Users;

namespace RacketReel.Application.Users.Commands;

public record FollowUserCommand(UserId UserId, UserId FollowerUserId) : ICommand;

public class FollowUserHandler(
    ILogger<FollowUserHandler> logger,
    IFollowerRepository followerRepository,
    TimeProvider timeProvider) : ICommandHandler<FollowUserCommand>
{
    public async Task<Result> Handle(FollowUserCommand request, CancellationToken cancellationToken)
    {
        try
        {
            if (request.UserId.Equals(request.FollowerUserId))
                return Result.Failure(new Error("CannotFollowSelf", "Cannot follow the user because it is the same as the following user"));

            var followerEntity = followerRepository.GetFollowerEntity(request.UserId, request.FollowerUserId);

            if (followerEntity != null)
                return Result.Failure(new Error("AlreadyFollowing", "Cannot follow the user because this follow relationship already exists"));

            var newFollowerEntity = new FollowerEntity();
            
            newFollowerEntity.Create(request.UserId, request.FollowerUserId, timeProvider.GetUtcNow());

            followerRepository.AddFollowerEntity(newFollowerEntity);

            await followerRepository.SaveChangesAsync(cancellationToken);

            return Result.Success();
        }
        catch (Exception e)
        {
            logger.LogWarning(e, "Unexpected exception handling request");
            
            return Result.Failure(ApplicationErrors.ServerError);
        }
    }
}