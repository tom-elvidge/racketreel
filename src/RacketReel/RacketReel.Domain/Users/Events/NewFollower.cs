using RacketReel.Domain.Common;
using RacketReel.Domain.Users;

namespace RacketReel.Domain.Followers.Events;

public record NewFollower(UserId UserId, UserId FollowerUserId, DateTimeOffset FollowedAtUtc) : IDomainEvent;