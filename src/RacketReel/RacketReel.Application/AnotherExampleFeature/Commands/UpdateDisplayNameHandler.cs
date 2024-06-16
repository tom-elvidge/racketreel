using MediatR;
using RacketReel.Domain.Users.Events;

namespace RacketReel.Application.AnotherExampleFeature.Commands;

public class UpdateDisplayNameHandler : INotificationHandler<DisplayNameUpdated>
{
    public Task Handle(DisplayNameUpdated notification, CancellationToken cancellationToken)
    {
        // todo: use domain event to update the display name for this feature too
        throw new NotImplementedException();
    }
}