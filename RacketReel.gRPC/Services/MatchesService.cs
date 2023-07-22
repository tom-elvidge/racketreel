using Grpc.Core;

namespace RacketReel.gRPC.Services;

public class MatchesService : Matches.MatchesBase
{
    public override async Task<GetSummaryReply> GetSummary(GetSummaryRequest request, ServerCallContext context)
    {
        return await base.GetSummary(request, context);
    }

    public override async Task<GetSummariesReply> GetSummaries(GetSummariesRequest request, ServerCallContext context)
    {
        return await base.GetSummaries(request, context);
    }

    public override async Task<GetStateReply> GetState(GetStateRequest request, ServerCallContext context)
    {
        return await base.GetState(request, context);
    }

    public override async Task<GetStateReply> GetStateAtVersion(GetStateAtVersionRequest request, ServerCallContext context)
    {
        return await base.GetStateAtVersion(request, context);
    }

    public override async Task<ConfigureReply> Configure(ConfigureRequest request, ServerCallContext context)
    {
        return await base.Configure(request, context);
    }

    public override async Task<PointReply> AddTeamOnePoint(PointRequest request, ServerCallContext context)
    {
        return await base.AddTeamOnePoint(request, context);
    }

    public override async Task<PointReply> AddTeamTwoPoint(PointRequest request, ServerCallContext context)
    {
        return await base.AddTeamTwoPoint(request, context);
    }

    public override async Task<PointReply> UndoPoint(PointRequest request, ServerCallContext context)
    {
        return await base.UndoPoint(request, context);
    }
}