using RacketReel.Domain.Users;

namespace RacketReel.Infrastructure.Users;

public class UserInfoRepository(ApplicationDbContext dbContext) : IUserInfoRepository
{
    public UserInfoEntity? GetUserInfoEntity(UserId id) =>
        dbContext.UserInfoEntities.FirstOrDefault(uie => uie.Id.Equals(id));

    public void AddUserInfoEntity(UserInfoEntity userInfoEntity) =>
        dbContext.UserInfoEntities.Add(userInfoEntity);

    public void RemoveUserInfoEntity(UserInfoEntity userInfoEntity) =>
        dbContext.UserInfoEntities.Remove(userInfoEntity);

    public Task<int> SaveChangesAsync(CancellationToken cancellationToken = default) =>
        dbContext.SaveChangesAsync(cancellationToken);
}