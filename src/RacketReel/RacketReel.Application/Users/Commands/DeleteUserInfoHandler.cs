using Microsoft.Extensions.Logging;
using RacketReel.Application.Common;
using RacketReel.Domain.Users;

namespace RacketReel.Application.Users.Commands;

public record DeleteUserInfoCommand(UserId Id) : ICommand;

public class DeleteUserInfoHandler(
    ILogger<DeleteUserInfoHandler> logger,
    IUserInfoRepository repository) : ICommandHandler<DeleteUserInfoCommand>
{
    public async Task<Result> Handle(DeleteUserInfoCommand request, CancellationToken cancellationToken)
    {
        try
        {
            var userInfoEntity = repository.GetUserInfoEntity(request.Id);

            if (userInfoEntity == null)
                return Result.Success();
            
            userInfoEntity.Delete();

            repository.RemoveUserInfoEntity(userInfoEntity);

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