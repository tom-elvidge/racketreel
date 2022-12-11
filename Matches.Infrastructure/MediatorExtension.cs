using MediatR;
using RacketReel.Services.Matches.Domain.SeedWork;

namespace Matches.Infrastructure;

// https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/seedwork-domain-model-base-classes-interfaces
static class MediatorExtension
{
    public static async Task DispatchDomainEventsAsync(this IMediator mediator, MatchesContext ctx)
    {
        var domainEntities = ctx.ChangeTracker
            .Entries<Entity>()
            .Where(x => x.Entity.DomainEvents != null && x.Entity.DomainEvents.Any());

        var domainEvents = domainEntities
            .SelectMany(x => x.Entity.DomainEvents)
            .ToList();

        domainEntities.ToList()
            .ForEach(entity => entity.Entity.ClearDomainEvents());

        foreach (var domainEvent in domainEvents)
            await mediator.Publish(domainEvent);
    }
}