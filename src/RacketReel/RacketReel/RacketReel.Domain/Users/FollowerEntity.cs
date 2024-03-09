using RacketReel.Domain.Common;
using RacketReel.Domain.Followers.Events;
using RacketReel.Domain.Users;

namespace RacketReel.Domain.Followers;

public class FollowerRelationEntity : Entity
{
    public UserId UserId { get; private set; } = new("");
    
    public UserId FollowerUserId { get; private set; } = new("");
    
    public DateTimeOffset FollowedAtUtc { get; private set; } = DateTimeOffset.MinValue;

    public FollowerRelationEntity(UserId userId, UserId followerUserId, DateTimeOffset followedAtUtc)
    {
        UserId = userId;
        FollowerUserId = followerUserId;
        FollowedAtUtc = followedAtUtc;
    }

    public FollowerRelationEntity()
    {
    }

    public void Create(UserId userId, UserId followerUserId, DateTimeOffset followedAtUtc)
    {
        UserId = userId;
        FollowerUserId = followerUserId;
        FollowedAtUtc = followedAtUtc;
        
        RaiseDomainEvent(new NewFollower(userId, followerUserId, followedAtUtc));
    }
}