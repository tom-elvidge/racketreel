using Microsoft.Extensions.Logging;
using RacketReel.Application.Common;
using RacketReel.Domain.Users;

namespace RacketReel.Application.Users.Commands;

public record UpdateUserInfoCommand(UserId Id, string? DisplayName = null, string? AvatarUri = null) : ICommand;

public class UpdateUserInfoHandler(
    ILogger<UpdateUserInfoHandler> logger,
    IUserInfoRepository repository) : ICommandHandler<UpdateUserInfoCommand>
{
    public async Task<Result> Handle(UpdateUserInfoCommand request, CancellationToken cancellationToken)
    {
        try
        {
            var userInfoEntity = repository.GetUserInfoEntity(request.Id);

            if (userInfoEntity == null)
                return Result.Failure(ApplicationErrors.NotFound);

            if (request.DisplayName != null)
                userInfoEntity.SetDisplayName(request.DisplayName);

            if (request.AvatarUri != null)
                userInfoEntity.SetAvatarUri(request.AvatarUri);

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