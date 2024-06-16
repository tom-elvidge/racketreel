using Microsoft.Extensions.Logging;
using RacketReel.Application.Common;
using RacketReel.Domain.Users;

namespace RacketReel.Application.Users.Queries;

public sealed record GetUserInfoQuery(UserId Id) : IQuery<UserInfoEntity>;

public sealed class GetUserInfoHandler(
    ILogger<GetUserInfoHandler> logger,
    IUserInfoRepository repository) : IQueryHandler<GetUserInfoQuery, UserInfoEntity>
{
    public Task<Result<UserInfoEntity>> Handle(GetUserInfoQuery request, CancellationToken cancellationToken)
    {
        try
        {
            var userInfoEntity = repository.GetUserInfoEntity(request.Id);

            return Task.FromResult(userInfoEntity == null
                ? Result.Failure<UserInfoEntity>(ApplicationErrors.NotFound)
                : Result.Success(userInfoEntity));
        }
        catch (Exception e)
        {
            logger.LogWarning(e, "Unexpected exception handling request");

            return Task.FromResult(Result.Failure<UserInfoEntity>(ApplicationErrors.ServerError));
        }
    }
}