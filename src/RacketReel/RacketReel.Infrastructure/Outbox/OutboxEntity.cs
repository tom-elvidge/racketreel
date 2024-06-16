namespace RacketReel.Infrastructure.Outbox;

public sealed record OutboxEntity(
    Guid Id,
    string Name,
    string Content,
    DateTimeOffset CreateAtUtc,
    DateTimeOffset? ProcessedAtUtc = null,
    string? Error = null);