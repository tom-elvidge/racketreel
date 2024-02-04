using RacketReel.Domain.Common;

namespace RacketReel.Domain.Users.Events;

public record AvatarUriUpdated(UserId Id, string AvatarUri) : IDomainEvent;