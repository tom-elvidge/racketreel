using RacketReel.Domain.Common;

namespace RacketReel.Domain.Users.Events;

public record DisplayNameUpdated(UserId Id, string DisplayName) : IDomainEvent;