using Microsoft.Extensions.Logging;
using RacketReel.Application.Common;
using RacketReel.Domain.Users;

namespace RacketReel.Application.Users.Commands;

public record CreateUserInfoCommand(UserId Id) : ICommand<UserInfoEntity>;

public class CreateUserInfoHandler(
    ILogger<CreateUserInfoHandler> logger,
    IUserInfoRepository repository,
    TimeProvider timeProvider) : ICommandHandler<CreateUserInfoCommand, UserInfoEntity>
{
    public async Task<Result<UserInfoEntity>> Handle(CreateUserInfoCommand request, CancellationToken cancellationToken)
    {
        try
        {
            var userInfoEntity = repository.GetUserInfoEntity(request.Id);

            if (userInfoEntity != null)
                return Result.Failure<UserInfoEntity>(new Error("UserAlreadyExists", "Cannot create the user because it already exists"));

            var newUserInfoEntity = new UserInfoEntity(request.Id, timeProvider.GetUtcNow());

            repository.AddUserInfoEntity(newUserInfoEntity);

            await repository.SaveChangesAsync(cancellationToken);

            return Result.Success(newUserInfoEntity);
        }
        catch (Exception e)
        {
            logger.LogWarning(e, "Unexpected exception handling request");
            
            return Result.Failure<UserInfoEntity>(ApplicationErrors.ServerError);
        }
    }
}