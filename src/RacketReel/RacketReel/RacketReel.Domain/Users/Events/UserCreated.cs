using RacketReel.Domain.Common;

namespace RacketReel.Domain.Users.Events;

public record UserCreated(UserId Id) : IDomainEvent;