using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Newtonsoft.Json;
using RacketReel.Domain.Common;

namespace RacketReel.Infrastructure.Outbox;

public class UpdateOutboxInterceptor : SaveChangesInterceptor
{
    public override ValueTask<InterceptionResult<int>> SavingChangesAsync(
        DbContextEventData eventData,
        InterceptionResult<int> result,
        CancellationToken cancellationToken = default)
    {
        var context = eventData.Context;
        
        if (context is not null) InsertOutboxEntity(context);
        
        return base.SavingChangesAsync(eventData, result, cancellationToken);
    }

    private static void InsertOutboxEntity(DbContext context)
    {
        var utcNow = DateTimeOffset.UtcNow;
        
        var outboxMessages = context
            .ChangeTracker
            .Entries<Entity>()
            .Select(x => x.Entity)
            .SelectMany(entity =>
            {
                var domainEvents = entity.GetDomainEvents();
                entity.ClearDomainEvents();
                return domainEvents;
            })
            .Select(domainEvent => new OutboxEntity(
                Guid.NewGuid(),
                domainEvent.GetType().Name,
                JsonConvert.SerializeObject(domainEvent, new JsonSerializerSettings
                {
                    TypeNameHandling = TypeNameHandling.All
                }),
                utcNow))
            .ToList();
        
        context.Set<OutboxEntity>().AddRange(outboxMessages);
    }
}