using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using RacketReel.Application.Users.Commands;
using RacketReel.Application.Users.Queries;
using RacketReel.Domain.Users;

namespace RacketReel.Infrastructure.Users;

[Authorize(Policy = Constants.Policies.Users)]
public class UsersRpcService(ISender sender) : UsersService.UsersServiceBase
{
    public override async Task<CreateUserInfoReply> CreateUserInfo(CreateUserInfoRequest request, ServerCallContext context)
    {
        var userId = context.GetUserId();
        
        var result = await sender.Send(new CreateUserInfoCommand(new UserId(userId)));
        
        if (result.IsFailure)
            return new CreateUserInfoReply
            {
                Success = false
            };
        
        return new CreateUserInfoReply
        {
            Success = true
        };
    }

    // public override async Task<DeleteUserInfoReply> DeleteUserInfo(DeleteUserInfoRequest request, ServerCallContext context)
    // {
    //     var reply = await sender.Send(new DeleteUserInfoCommand(new UserId(request.UserId)));
    //
    //     if (reply.IsFailure)
    //         return new DeleteUserInfoReply
    //         {
    //             Success = false
    //         };
    //
    //     return new DeleteUserInfoReply
    //     {
    //         Success = true
    //     };
    // }
    
    public override async Task<GetUserInfoReply> GetUserInfo(GetUserInfoRequest request, ServerCallContext context)
    {
        var result = await sender.Send(new GetUserInfoQuery(new UserId(request.UserId)));

        if (result.IsFailure)
            return new GetUserInfoReply
            {
                Error = new Error
                {
                    Code = result.Error.Code,
                    Message = result.Error.Message
                },
                Success = false
            };

        return new GetUserInfoReply
        {
            UserInfo = new UserInfo
            {
                AvatarUri = result.Value.AvatarUri,
                DisplayName = result.Value.DisplayName,
                JoinedAtUtc = result.Value.JoinedAtUtc.ToTimestamp(),
                UserId = result.Value.Id.Value
            },
            Success = true
        };
    }

    public override async Task<UpdateUserInfoReply> UpdateUserInfo(UpdateUserInfoRequest request, ServerCallContext context)
    {
        var userId = context.GetUserId();

        var command = new UpdateUserInfoCommand(
            new UserId(userId),
            request.HasDisplayName ? request.DisplayName : null,
            request.HasAvatarUri ? request.AvatarUri : null);
        
        var result = await sender.Send(command);
        
        if (result.IsFailure)
            return new UpdateUserInfoReply
            {
                Error = new Error
                {
                    Code = result.Error.Code,
                    Message = result.Error.Message
                },
                Success = false
            };

        return new UpdateUserInfoReply
        {
            Success = true
        };
    }

    public override async Task<FollowUserReply> FollowUser(FollowUserRequest request, ServerCallContext context)
    {
        var userId = context.GetUserId();
        
        var result = await sender.Send(new FollowUserCommand(new UserId(request.UserId), new UserId(userId)));
        
        if (result.IsFailure)
            return new FollowUserReply
            {
                Error = new Error
                {
                    Code = result.Error.Code,
                    Message = result.Error.Message
                },
                Success = false
            };
        
        return new FollowUserReply
        {
            Success = true
        };
    }

    public override async Task<UnfollowUserReply> UnfollowUser(UnfollowUserRequest request, ServerCallContext context)
    {
        var userId = context.GetUserId();
        
        var result = await sender.Send(new UnfollowUserCommand(new UserId(request.UserId), new UserId(userId)));
        
        if (result.IsFailure)
            return new UnfollowUserReply
            {
                Error = new Error
                {
                    Code = result.Error.Code,
                    Message = result.Error.Message
                },
                Success = false
            };
        
        return new UnfollowUserReply
        {
            Success = true
        };
    }

    public override async Task<GetFollowersReply> GetFollowers(GetFollowersRequest request, ServerCallContext context)
    {
        var result = await sender.Send(new GetFollowersQuery(new UserId(request.UserId)));
        
        if (result.IsFailure)
            return new GetFollowersReply
            {
                Error = new Error
                {
                    Code = result.Error.Code,
                    Message = result.Error.Message
                },
                Success = false
            };

        var reply = new GetFollowersReply
        {
            Success = true
        };
        
        reply.FollowerUserInfos.AddRange(result.Value.Select(uie => new UserInfo
        {
            AvatarUri = uie.AvatarUri,
            DisplayName = uie.DisplayName,
            JoinedAtUtc = uie.JoinedAtUtc.ToTimestamp(),
            UserId = uie.Id.Value
        }));

        return reply;
    }

    public override async Task<GetFollowingReply> GetFollowing(GetFollowingRequest request, ServerCallContext context)
    {
        var result = await sender.Send(new GetFollowingQuery(new UserId(request.UserId)));
        
        if (result.IsFailure)
            return new GetFollowingReply
            {
                Error = new Error
                {
                    Code = result.Error.Code,
                    Message = result.Error.Message
                },
                Success = false
            };

        var reply = new GetFollowingReply
        {
            Success = true
        };
        
        reply.FollowingUserInfos.AddRange(result.Value.Select(uie => new UserInfo
        {
            AvatarUri = uie.AvatarUri,
            DisplayName = uie.DisplayName,
            JoinedAtUtc = uie.JoinedAtUtc.ToTimestamp(),
            UserId = uie.Id.Value
        }));

        return reply;
    }
}