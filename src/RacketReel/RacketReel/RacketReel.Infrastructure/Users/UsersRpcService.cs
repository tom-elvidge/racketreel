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
        
        var reply = await sender.Send(new CreateUserInfoCommand(new UserId(userId)));
        
        if (reply.IsFailure)
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
        var reply = await sender.Send(new GetUserInfoQuery(new UserId(request.UserId)));

        if (reply.IsFailure)
            return new GetUserInfoReply
            {
                Error = new Error
                {
                    Code = reply.Error.Code,
                    Message = reply.Error.Message
                },
                Success = false
            };

        return new GetUserInfoReply
        {
            UserInfo = new UserInfo
            {
                AvatarUri = reply.Value.AvatarUri,
                DisplayName = reply.Value.DisplayName,
                JoinedAtUtc = reply.Value.JoinedAtUtc.ToTimestamp(),
                UserId = reply.Value.Id.Value
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
        
        var reply = await sender.Send(command);
        
        if (reply.IsFailure)
            return new UpdateUserInfoReply
            {
                Error = new Error
                {
                    Code = reply.Error.Code,
                    Message = reply.Error.Message
                },
                Success = false
            };

        return new UpdateUserInfoReply
        {
            Success = true
        };
    }
}