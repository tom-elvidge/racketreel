using RacketReel.Domain.Common;

namespace RacketReel.Domain.Users.Events;

public record UserDeleted(UserId Id) : IDomainEvent;