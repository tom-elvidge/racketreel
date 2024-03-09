using Microsoft.Extensions.Logging;
using RacketReel.Application.Common;
using RacketReel.Domain.Users;

namespace RacketReel.Application.Users.Commands;

public record UnfollowUserCommand(UserId UserId, UserId FollowerUserId) : ICommand;

public class UnfollowUserHandler(
    ILogger<UnfollowUserHandler> logger,
    IFollowerRepository repository) : ICommandHandler<UnfollowUserCommand>
{
    public async Task<Result> Handle(UnfollowUserCommand request, CancellationToken cancellationToken)
    {
        try
        {
            var followerEntity = repository.GetFollowerEntity(request.UserId, request.FollowerUserId);

            if (followerEntity == null)
                return Result.Success();

            repository.RemoveFollowerEntity(followerEntity);

            await repository.SaveChangesAsync(cancellationToken);

            return Result.Success();
        }
        catch (Exception e)
        {
            logger.LogWarning(e, "Unexpected exception handling request");
            
            return Result.Failure(ApplicationErrors.ServerError);
        }
    }
}