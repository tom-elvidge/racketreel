using RacketReel.Domain.Followers;

namespace RacketReel.Domain.Users;

public interface IFollowerRepository
{
    public FollowerEntity? GetFollowerEntity(UserId userId, UserId followerUserId);
    
    public IEnumerable<FollowerEntity> GetFollowerEntities(UserId userId);

    public IEnumerable<FollowerEntity> GetFollowerEntitiesByFollowerUserId(UserId followerUserId);

    public void AddFollowerEntity(FollowerEntity followerEntity);

    public void RemoveFollowerEntity(FollowerEntity followerEntity);
    
    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
}