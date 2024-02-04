using RacketReel.Domain.Common;
using RacketReel.Domain.Users.Events;

namespace RacketReel.Domain.Users;

public class UserInfoEntity : Entity
{
    public UserInfoEntity(UserId id, DateTimeOffset joinedAtUtc)
    {
        Id = id;
        DisplayName = "";
        AvatarUri = "";
        JoinedAtUtc = joinedAtUtc;
        
        RaiseDomainEvent(new UserCreated(id));
    }

    public UserId Id { get; init; }
    
    public string DisplayName { get; private set; }
    
    public string AvatarUri { get; private set; }
    
    public DateTimeOffset JoinedAtUtc { get; init; }

    public void SetDisplayName(string displayName)
    {
        DisplayName = displayName;
        
        RaiseDomainEvent(new DisplayNameUpdated(Id, displayName));
    }

    public void SetAvatarUri(string avatarUri)
    {
        AvatarUri = avatarUri;
        
        RaiseDomainEvent(new AvatarUriUpdated(Id, avatarUri));
    }

    public void Delete()
    {
        RaiseDomainEvent(new UserDeleted(Id));
    }
}