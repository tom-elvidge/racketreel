using RacketReel.Domain.Common;
using RacketReel.Domain.Users.Events;

namespace RacketReel.Domain.Users;

public class UserInfoEntity : Entity
{
    public UserId Id { get; private set; } = new("");

    public string DisplayName { get; private set; } = "";

    public string AvatarUri { get; private set; } = "";

    public DateTimeOffset JoinedAtUtc { get; private set; } = DateTimeOffset.MinValue;

    public UserInfoEntity(UserId id, string displayName, string avatarUri, DateTime joinedAtUtc)
    {
        Id = id;
        DisplayName = displayName;
        AvatarUri = avatarUri;
        JoinedAtUtc = joinedAtUtc;
    }

    public UserInfoEntity()
    {
    }

    public void Create(UserId id, DateTimeOffset joinedAtUtc)
    {
        Id = id;
        JoinedAtUtc = joinedAtUtc;
        
        RaiseDomainEvent(new UserCreated(id));
    }

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