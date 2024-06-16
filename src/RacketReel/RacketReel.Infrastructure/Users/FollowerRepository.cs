using RacketReel.Domain.Followers;
using RacketReel.Domain.Users;

namespace RacketReel.Infrastructure.Users;

public class FollowerRepository(ApplicationDbContext dbContext) : IFollowerRepository
{
    public FollowerEntity? GetFollowerEntity(UserId userId, UserId followerUserId) =>
        dbContext.FollowerEntities.FirstOrDefault(fe =>
            fe.UserId.Equals(userId) && fe.FollowerUserId.Equals(followerUserId));

    public IEnumerable<FollowerEntity> GetFollowerEntities(UserId userId) =>
        dbContext.FollowerEntities.Where(fe => fe.UserId.Equals(userId));

    public IEnumerable<FollowerEntity> GetFollowerEntitiesByFollowerUserId(UserId followerUserId) =>
        dbContext.FollowerEntities.Where(fe => fe.FollowerUserId.Equals(followerUserId));

    public void AddFollowerEntity(FollowerEntity followerEntity) =>
        dbContext.FollowerEntities.Add(followerEntity);

    public void RemoveFollowerEntity(FollowerEntity followerEntity) =>
        dbContext.FollowerEntities.Remove(followerEntity);

    public Task<int> SaveChangesAsync(CancellationToken cancellationToken = default) =>
        dbContext.SaveChangesAsync(cancellationToken);
}