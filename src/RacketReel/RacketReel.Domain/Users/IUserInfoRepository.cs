namespace RacketReel.Domain.Users;

public interface IUserInfoRepository
{
    public UserInfoEntity? GetUserInfoEntity(UserId id);

    public IEnumerable<UserInfoEntity> GetUserInfoEntities(IEnumerable<UserId> ids);

    public void AddUserInfoEntity(UserInfoEntity userInfoEntity);

    public void RemoveUserInfoEntity(UserInfoEntity userInfoEntity);
    
    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
}