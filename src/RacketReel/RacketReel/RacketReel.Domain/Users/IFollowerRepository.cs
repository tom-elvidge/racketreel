using RacketReel.Domain.Followers;

namespace RacketReel.Domain.Users;

public interface IFollowerEntityRepository
{
    public FollowerEntity? GetFollowerEntity(UserId userId, UserId followerUserId);
    
    public List<FollowerEntity> GetFollowerEntities(UserId userId);

    public List<FollowerEntity> GetFollowerEntitiesByFollowerUserId(UserId followerUserId);

    public void AddFollowerEntity(FollowerEntity followerEntity);

    public void RemoveFollowerEntity(FollowerEntity followerEntity);
    
    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
}