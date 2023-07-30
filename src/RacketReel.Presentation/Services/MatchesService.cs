using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using MediatR;
using RacketReel.Application.Commands.AddPoint;
using RacketReel.Application.Commands.CreateMatch;
using RacketReel.Application.Commands.UndoPoint;
using RacketReel.Application.Errors;
using RacketReel.Application.Models;
using RacketReel.Application.Queries.GetAllStates;
using RacketReel.Application.Queries.GetMatchById;
using RacketReel.Application.Queries.GetMatches;
using RacketReel.Application.Queries.GetMatchMetadata;
using RacketReel.Application.Queries.GetStateByIndex;
using ApplicationTeam = RacketReel.Application.Models.Team;
using ApplicationFormat = RacketReel.Application.Models.Format;
using ApplicationState = RacketReel.Application.Models.State;

namespace RacketReel.Presentation.Services;

// Separate project for Presentation so it cannot access infrastructure directly

public class MatchesService : Matches.MatchesBase
{
    private readonly ISender _sender;

    public MatchesService(ISender sender)
    {
        _sender = sender;
    }

    public override async Task<GetSummaryReply> GetSummary(GetSummaryRequest request, ServerCallContext context)
    {
        var result = await _sender.Send(new GetMatchByIdQuery(request.MatchId));

        if (result.IsFailure)
        {
            if (result.Error == ApplicationErrors.NotFound)
                return new GetSummaryReply
                {
                    Success = false,
                    Error = GetSummaryError.GetSummaryMatchDoesNotExist
                };
            
            return new GetSummaryReply
            {
                Success = false,
                Error = GetSummaryError.GetSummaryUnknown
            };
        }

        var match = result.Value;
        return new GetSummaryReply
        {
            Success = true,
            Summary = CreateSummary(match)
        };
    }

    public override async Task<GetSummariesReply> GetSummaries(GetSummariesRequest request, ServerCallContext context)
    {
        var result = await _sender.Send(new GetMatchesQuery(request.PageSize, request.PageNumber));

        if (result.IsFailure)
        {
            return new GetSummariesReply
            {
                Success = false
            };
        }

        var reply = new GetSummariesReply
        {
            Success = true,
            PageCount = result.Value.PageCount
        };
        reply.Summaries.AddRange(result.Value.Page.Select(CreateSummary));
        return reply;
    }

    public override async Task<GetStateReply> GetState(GetStateRequest request, ServerCallContext context)
    {
        var getStateResult = await _sender.Send(new GetStateByIndexQuery(request.MatchId, request.StateVersion));
        
        if (getStateResult.IsFailure)
        {
            return new GetStateReply
            {
                Success = false
            };
        }

        var getMetadataResult = await _sender.Send(new GetMatchMetadataQuery(request.MatchId));

        if (getMetadataResult.IsFailure)
        {
            return new GetStateReply
            {
                Success = false
            };
        }

        return new GetStateReply
        {
            Success = true,
            State = CreateState(getStateResult.Value, getMetadataResult.Value.TeamOneName,
                getMetadataResult.Value.TeamTwoName)
        };
    }

    public override async Task<GetStateHistoryReply> GetStateHistory(GetStateHistoryRequest request, ServerCallContext context)
    {
        var getStatesTask = _sender.Send(new GetAllStatesQuery(request.MatchId));
        var getMetadataTask = _sender.Send(new GetMatchMetadataQuery(request.MatchId));
        await Task.WhenAll(getMetadataTask, getStatesTask);

        if (getStatesTask.Result.IsFailure || getMetadataTask.Result.IsFailure)
        {
            return new GetStateHistoryReply
            {
                Success = false
            };
        }

        var reply = new GetStateHistoryReply { Success = true };
        var metadata = getMetadataTask.Result.Value;
        reply.States.AddRange(getStatesTask.Result.Value
            .Select(x => CreateState(x, metadata.TeamOneName, metadata.TeamTwoName)));
        return reply;
    }

    public override async Task<GetStateReply> GetStateAtVersion(GetStateAtVersionRequest request,
        ServerCallContext context)
    {
        var getStateTask = _sender.Send(new GetStateByIndexQuery(request.MatchId, request.Version));
        var getMetadataTask = _sender.Send(new GetMatchMetadataQuery(request.MatchId));
        await Task.WhenAll(getMetadataTask, getStateTask);

        if (getStateTask.Result.IsFailure || getMetadataTask.Result.IsFailure)
        {
            return new GetStateReply
            {
                Success = false
            };
        }

        var metadata = getMetadataTask.Result.Value;

        return new GetStateReply
        {
            Success = true,
            State = CreateState(getStateTask.Result.Value, metadata.TeamOneName, metadata.TeamTwoName)
        };
    }

    public override async Task<ConfigureReply> Configure(ConfigureRequest request, ServerCallContext context)
    {
        var result = await _sender.Send(new CreateMatchCommand(
            request.TeamOneName,
            request.TeamTwoName,
            request.ServingFirst == Team.One ? ApplicationTeam.TeamOne : ApplicationTeam.TeamTwo,
            request.Format switch
            {
                Format.Fast4 => ApplicationFormat.FastFour,
                Format.BestOfFive => ApplicationFormat.BestOfFive,
                Format.BestOfOne => ApplicationFormat.BestOfOne,
                Format.BestOfThree => ApplicationFormat.BestOfThree,
                Format.TiebreakToTen => ApplicationFormat.TiebreakToTen,
                Format.BestOfFiveFst => ApplicationFormat.BestOfFiveFinalSetTiebreak,
                Format.BestOfThreeFst => ApplicationFormat.BestOfThreeFinalSetTiebreak,
                _ => throw new ArgumentException($"Missing format for {request.Format}")
            }));

        if (result.IsFailure)
            return new ConfigureReply
            {
                Success = false,
                Error = ConfigureError.Unknown
            };

        return new ConfigureReply
        {
            Success = true,
            MatchId = result.Value.MatchId.ToString()
        };
    }

    public override async Task<AddPointReply> AddPoint(AddPointRequest request, ServerCallContext context)
    {
        var result = await _sender.Send(new AddPointCommand(
            request.MatchId,
            request.Team == Team.One ? ApplicationTeam.TeamOne : ApplicationTeam.TeamTwo));

        if (result.IsFailure)
            return new AddPointReply
            {
                Success = false,
                Error = AddPointError.AddPointUnknown
            };

        return new AddPointReply
        {
            Success = true
        };
    }

    public override async Task<UndoPointReply> UndoPoint(UndoPointRequest request, ServerCallContext context)
    {
        var result = await _sender.Send(new UndoPointCommand(request.MatchId));
        
        if (result.IsFailure)
            return new UndoPointReply
            {
                Success = false,
                Error = UndoPointError.UndoPointUnknown
            };

        return new UndoPointReply
        {
            Success = true
        };
    }

    private State CreateState(ApplicationState state, string teamOneName, string teamTwoName)
    {
        string PointToString(bool tiebreak, int points)
        {
            if (tiebreak) return points.ToString();

            return points switch
            {
                0 => "0",
                1 => "15",
                2 => "30",
                3 => "40",
                4 => "AD",
                _ => throw new ArgumentException("Points cannot be 5 or greater when not a tiebreak")
            };
        }

        return new State
        {
            CreatedAtUtc = Timestamp.FromDateTime(state.CreatedAtUtc),
            Highlighted = state.Highlighted,
            Serving = state.Serving == ApplicationTeam.TeamOne ? Team.One : Team.Two,
            TeamOnePoints = PointToString(state.Tiebreak, state.TeamOnePoints),
            TeamTwoPoints = PointToString(state.Tiebreak, state.TeamTwoPoints),
            TeamOneGames = state.TeamOneGames.ToString(),
            TeamTwoGames = state.TeamTwoGames.ToString(),
            TeamOneSets = state.TeamOneSets.ToString(),
            TeamTwoSets = state.TeamTwoSets.ToString(),
            TeamOneName = teamOneName,
            TeamTwoName = teamTwoName
        };
    }

    private Summary CreateSummary(Match match)
    {
        return new Summary
        {
            CompletedAtUtc = Timestamp.FromDateTime(match.CompletedAt),
            Duration = Duration.FromTimeSpan(match.CompletedAt - match.CompletedAt),
            Format = match.Format switch
            {
                ApplicationFormat.TiebreakToTen => Format.TiebreakToTen,
                ApplicationFormat.BestOfOne => Format.BestOfOne,
                ApplicationFormat.BestOfThree => Format.BestOfThree,
                ApplicationFormat.BestOfFive => Format.BestOfFive,
                ApplicationFormat.BestOfThreeFinalSetTiebreak => Format.BestOfThreeFst,
                ApplicationFormat.BestOfFiveFinalSetTiebreak => Format.BestOfFiveFst,
                ApplicationFormat.FastFour => Format.Fast4,
                _ => throw new ArgumentOutOfRangeException($"Unexpected Format of {nameof(ApplicationFormat)}")
            },
            MatchId = match.Id,
            SetOne = new SetSummary
            {
                TeamOneGames = match.SetOne.TeamOneGames,
                TeamTwoGames = match.SetOne.TeamTwoGames,
                Tiebreak = match.SetOne.TiebreakPlayed,
                TeamOneTiebreakPoints = match.SetOne.TeamOneTiebreakPoints ?? 0,
                TeamTwoTiebreakPoints = match.SetOne.TeamTwoTiebreakPoints ?? 0
            },
            SetTwo = match.SetTwo == null
                ? null
                : new SetSummary
                {
                    TeamOneGames = match.SetTwo.TeamOneGames,
                    TeamTwoGames = match.SetTwo.TeamTwoGames,
                    Tiebreak = match.SetTwo.TiebreakPlayed,
                    TeamOneTiebreakPoints = match.SetTwo.TeamOneTiebreakPoints ?? 0,
                    TeamTwoTiebreakPoints = match.SetTwo.TeamTwoTiebreakPoints ?? 0
                },
            SetThree = match.SetThree == null
                ? null
                : new SetSummary
                {
                    TeamOneGames = match.SetThree.TeamOneGames,
                    TeamTwoGames = match.SetThree.TeamTwoGames,
                    Tiebreak = match.SetThree.TiebreakPlayed,
                    TeamOneTiebreakPoints = match.SetThree.TeamOneTiebreakPoints ?? 0,
                    TeamTwoTiebreakPoints = match.SetThree.TeamTwoTiebreakPoints ?? 0
                },
            SetFour = match.SetFour == null
                ? null
                : new SetSummary
                {
                    TeamOneGames = match.SetFour.TeamOneGames,
                    TeamTwoGames = match.SetFour.TeamTwoGames,
                    Tiebreak = match.SetFour.TiebreakPlayed,
                    TeamOneTiebreakPoints = match.SetFour.TeamOneTiebreakPoints ?? 0,
                    TeamTwoTiebreakPoints = match.SetFour.TeamTwoTiebreakPoints ?? 0
                },
            SetFive = match.SetFive == null
                ? null
                : new SetSummary
                {
                    TeamOneGames = match.SetFive.TeamOneGames,
                    TeamTwoGames = match.SetFive.TeamTwoGames,
                    Tiebreak = match.SetFive.TiebreakPlayed,
                    TeamOneTiebreakPoints = match.SetFive.TeamOneTiebreakPoints ?? 0,
                    TeamTwoTiebreakPoints = match.SetFive.TeamTwoTiebreakPoints ?? 0
                }
        };
    }
}