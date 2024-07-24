using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using Matches.Application;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Matches.Application.Commands.AddPoint;
using Matches.Application.Commands.CreateMatch;
using Matches.Application.Commands.DeleteMatch;
using Matches.Application.Commands.ToggleHighlight;
using Matches.Application.Commands.UndoPoint;
using Matches.Application.Errors;
using Matches.Application.Models.Match;
using Matches.Application.Queries.GetAllStates;
using Matches.Application.Queries.GetInProgressMatches;
using Matches.Application.Queries.GetLatestState;
using Matches.Application.Queries.GetMatchById;
using Matches.Application.Queries.GetMatches;
using Matches.Application.Queries.GetMatchMetadata;
using Matches.Application.Queries.GetStateByIndex;
using Microsoft.Extensions.Logging;
using ApplicationTeam = Matches.Application.Models.Match.Team;
using ApplicationFormat = Matches.Application.Models.Match.Format;
using ApplicationState = Matches.Application.Models.Match.State;
using ApplicationMetadata = Matches.Application.Models.Match.Metadata;

namespace Matches.Presentation.Services;

// Separate project for Presentation so it cannot access infrastructure directly
public class MatchesRpcService : Matches.MatchesBase
{
    private readonly ISender _sender;
    private readonly IChannelProvider _channelProvider;
    private readonly ILogger<MatchesRpcService> _logger;

    public MatchesRpcService(ISender sender, IChannelProvider channelProvider, ILogger<MatchesRpcService> logger)
    {
        _sender = sender;
        _channelProvider = channelProvider;
        _logger = logger;
    }

    public override async Task<GetSummaryReply> GetSummary(GetSummaryRequest request, ServerCallContext context)
    {
        var getMatchResult = await _sender.Send(new GetMatchByIdQuery(request.MatchId));

        if (getMatchResult.IsFailure)
        {
            if (getMatchResult.Error == ApplicationErrors.NotFound)
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
        
        var match = getMatchResult.Value;

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
    
    public override async Task<GetSummaryV2Reply> GetSummaryV2(GetSummaryRequest request, ServerCallContext context)
    {
        var result = await _sender.Send(new GetMatchByIdQuery(request.MatchId));

        if (result.IsFailure)
        {
            if (result.Error == ApplicationErrors.NotFound)
                return new GetSummaryV2Reply
                {
                    Success = false,
                    Error = GetSummaryError.GetSummaryMatchDoesNotExist
                };
            
            return new GetSummaryV2Reply
            {
                Success = false,
                Error = GetSummaryError.GetSummaryUnknown
            };
        }

        var match = result.Value;
        
        return new GetSummaryV2Reply
        {
            Success = true,
            Summary = CreateSummaryV2(match)
        };
    }

    public override async Task<GetSummariesV2Reply> GetSummariesV2(GetSummariesV2Request request, ServerCallContext context)
    {
        var result = await _sender.Send(new GetMatchesQuery(request.PageSize, request.PageNumber, request.AllUsers ? null : request.UserIds.ToArray()));

        if (result.IsFailure)
        {
            return new GetSummariesV2Reply
            {
                Success = false
            };
        }

        var reply = new GetSummariesV2Reply
        {
            Success = true,
            PageCount = result.Value.PageCount
        };
        
        reply.Summaries.AddRange(result.Value.Page.Select(CreateSummaryV2));
        
        return reply;
    }

    public override async Task<GetInProgressReply> GetInProgress(GetInProgressRequest request, ServerCallContext context)
    {
        var result = await _sender.Send(new GetInProgressMatchesQuery(request.PageSize, request.PageNumber, request.AllUsers ? null : request.UserIds.ToArray()));

        if (result.IsFailure)
        {
            return new GetInProgressReply
            {
                Success = false
            };
        }

        var reply = new GetInProgressReply
        {
            Success = true,
            PageCount = result.Value.PageCount
        };
        
        reply.Matches.AddRange(result.Value.Page.Select(sm => CreateState(sm.Item2, sm.Item1)));
        
        return reply;
    }

    public override async Task<GetStateReply> GetState(GetStateRequest request, ServerCallContext context)
    {
        var getStateResult = await _sender.Send(new GetLatestStateQuery(request.MatchId));
        
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
            State = CreateState(getStateResult.Value, getMetadataResult.Value)
        };
    }

    public override async Task<GetStateHistoryReply> GetStateHistory(GetStateHistoryRequest request, ServerCallContext context)
    {
        var getStatesTask = await _sender.Send(new GetAllStatesQuery(request.MatchId));
        var getMetadataTask = await _sender.Send(new GetMatchMetadataQuery(request.MatchId));

        if (getStatesTask.IsFailure || getMetadataTask.IsFailure)
        {
            return new GetStateHistoryReply
            {
                Success = false
            };
        }

        var reply = new GetStateHistoryReply { Success = true };
        var metadata = getMetadataTask.Value;
        reply.States.AddRange(getStatesTask.Value
            .Select(x => CreateState(x, metadata)));
        return reply;
    }

    public override async Task<GetStateReply> GetStateAtVersion(GetStateAtVersionRequest request,
        ServerCallContext context)
    {
        var getStateTask = await _sender.Send(new GetStateByIndexQuery(request.MatchId, request.Version));
        var getMetadataTask = await _sender.Send(new GetMatchMetadataQuery(request.MatchId));

        if (getStateTask.IsFailure || getMetadataTask.IsFailure)
        {
            return new GetStateReply
            {
                Success = false
            };
        }

        var metadata = getMetadataTask.Value;

        return new GetStateReply
        {
            Success = true,
            State = CreateState(getStateTask.Value, metadata)
        };
    }

    [Authorize]
    public override async Task<ConfigureReply> Configure(ConfigureRequest request, ServerCallContext context)
    {
        var userId = context.GetUserId();

        var command = new CreateMatchCommand(
            userId,
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
                Format.LtaCambridgeDoublesLeague => ApplicationFormat.LtaCambridgeDoublesLeague,
                _ => throw new ArgumentException($"Missing format for {request.Format}")
            });
        var result = await _sender.Send(command);

        if (result.IsFailure)
            return new ConfigureReply
            {
                Success = false,
                Error = ConfigureError.Unknown
            };

        return new ConfigureReply
        {
            Success = true,
            MatchId = result.Value.MatchId
        };
    }

    [Authorize]
    public override async Task<AddPointReply> AddPoint(AddPointRequest request, ServerCallContext context)
    {
        // todo add user_id and handle case where mediatr comes back with unauthenticated
        var userId = context.GetUserId();
        
        var result = await _sender.Send(new AddPointCommand(
            userId,
            request.MatchId,
            request.Team == Team.One ? ApplicationTeam.TeamOne : ApplicationTeam.TeamTwo));

        if (!result.IsFailure)
            return new AddPointReply
            {
                Success = true
            };
        
        if (result.Error == ApplicationErrors.Unauthorized)
        {
            return new AddPointReply
            {
                Success = false,
                Error = AddPointError.AddPointUnauthorized
            };
        }
            
        return new AddPointReply
        {
            Success = false,
            Error = AddPointError.AddPointUnknown
        };
    }

    [Authorize]
    public override async Task<UndoPointReply> UndoPoint(UndoPointRequest request, ServerCallContext context)
    {
        var userId = context.GetUserId();
        
        var result = await _sender.Send(new UndoPointCommand(
            userId,
            request.MatchId));

        if (!result.IsFailure)
            return new UndoPointReply
            {
                Success = true
            };
        
        if (result.Error == ApplicationErrors.Unauthorized)
            return new UndoPointReply
            {
                Success = false,
                Error = UndoPointError.UndoPointUnauthorized
            };
            
        return new UndoPointReply
        {
            Success = false,
            Error = UndoPointError.UndoPointUnknown
        };

    }

    [Authorize]
    public override async Task<ToggleHighlightReply> ToggleHighlight(ToggleHighlightRequest request, ServerCallContext context)
    {
        var userId = context.GetUserId();
        
        var result = await _sender.Send(new ToggleHighlightCommand(
            userId,
            request.MatchId,
            request.Version));
        
        // todo generic error handling

        if (!result.IsFailure)
            return new ToggleHighlightReply
            {
                Success = true
            };
        
        if (result.Error == ApplicationErrors.Unauthorized)
            return new ToggleHighlightReply
            {
                Success = false,
                Error = ToggleHighlightError.ToggleHighlightUnauthorized
            };

        if (result.Error == ApplicationErrors.NotFound)
            return new ToggleHighlightReply
            {
                Success = false,
                Error = ToggleHighlightError.ToggleHighlightStateDoesNotExist
            };
            
        return new ToggleHighlightReply
        {
            Success = false,
            Error = ToggleHighlightError.ToggleHighlightUnknown
        };
    }
    
    [Authorize]
    public override async Task<DeleteMatchReply> DeleteMatch(DeleteMatchRequest request, ServerCallContext context)
    {
        var userId = context.GetUserId();
        
        var result = await _sender.Send(new DeleteMatchCommand(
            userId,
            request.MatchId));

        if (!result.IsFailure)
            return new DeleteMatchReply
            {
                Success = true
            };
        
        if (result.Error == ApplicationErrors.Unauthorized)
            return new DeleteMatchReply
            {
                Success = false,
                Error = DeleteMatchError.DeleteMatchUnauthorized
            };

        if (result.Error == ApplicationErrors.NotFound)
            return new DeleteMatchReply
            {
                Success = false,
                Error = DeleteMatchError.DeleteMatchMatchDoesNotExist
            };
            
        return new DeleteMatchReply
        {
            Success = false,
            Error = DeleteMatchError.DeleteMatchUnknown
        };
    }
    
    public override async Task GetStateStream(
        GetStateStreamRequest request,
        IServerStreamWriter<State> responseStream,
        ServerCallContext context)
    {
        try
        {
            var getMetadataResult = await _sender.Send(new GetMatchMetadataQuery(request.MatchId));

            if (getMetadataResult.IsFailure) return;

            var getLatestStateResult = await _sender.Send(new GetLatestStateQuery(request.MatchId));

            if (getLatestStateResult.IsFailure) return;

            await responseStream.WriteAsync(CreateState(getLatestStateResult.Value, getMetadataResult.Value));

            var reader = await _channelProvider.CreateChannel(request.MatchId, context.Peer);

            while (!context.CancellationToken.IsCancellationRequested)
            {
                if (reader.TryRead(out var state))
                {
                    await responseStream.WriteAsync(CreateState(state, getMetadataResult.Value));
                }
            }
        }
        catch (Exception e)
        {
            _logger.LogError(e, "Unexpected exception handling state stream");
        }
        finally
        {
            await _channelProvider.DeleteChannel(request.MatchId, context.Peer);
        }
    }
    
    private State CreateState(ApplicationState state, ApplicationMetadata metadata)
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
            TeamOneName = metadata.TeamOneName,
            TeamTwoName = metadata.TeamTwoName,
            Version = state.Version,
            Completed = state.Completed,
            Format = metadata.Format switch
            {
                ApplicationFormat.TiebreakToTen => Format.TiebreakToTen,
                ApplicationFormat.BestOfOne => Format.BestOfOne,
                ApplicationFormat.BestOfThree => Format.BestOfThree,
                ApplicationFormat.BestOfFive => Format.BestOfFive,
                ApplicationFormat.BestOfThreeFinalSetTiebreak => Format.BestOfThreeFst,
                ApplicationFormat.BestOfFiveFinalSetTiebreak => Format.BestOfFiveFst,
                ApplicationFormat.FastFour => Format.Fast4,
                ApplicationFormat.LtaCambridgeDoublesLeague => Format.LtaCambridgeDoublesLeague,
                _ => throw new ArgumentOutOfRangeException($"Unexpected Format of {nameof(ApplicationFormat)}")
            },
            StartedAtUtc = Timestamp.FromDateTime(metadata.CreatedAt),
            MatchId = state.MatchId,
            CreatorUserId = metadata.CreateByUserId
        };
    }

    private Summary CreateSummary(Match match)
    {
        return new Summary
        {
            StartedAtUtc = Timestamp.FromDateTime(match.CreatedAt),
            CompletedAtUtc = Timestamp.FromDateTime(match.CompletedAt),
            Duration = Duration.FromTimeSpan(match.CompletedAt - match.CreatedAt),
            Format = match.Format switch
            {
                ApplicationFormat.TiebreakToTen => Format.TiebreakToTen,
                ApplicationFormat.BestOfOne => Format.BestOfOne,
                ApplicationFormat.BestOfThree => Format.BestOfThree,
                ApplicationFormat.BestOfFive => Format.BestOfFive,
                ApplicationFormat.BestOfThreeFinalSetTiebreak => Format.BestOfThreeFst,
                ApplicationFormat.BestOfFiveFinalSetTiebreak => Format.BestOfFiveFst,
                ApplicationFormat.FastFour => Format.Fast4,
                ApplicationFormat.LtaCambridgeDoublesLeague => Format.LtaCambridgeDoublesLeague,
                _ => throw new ArgumentOutOfRangeException($"Unexpected Format of {nameof(ApplicationFormat)}")
            },
            MatchId = match.Id,
            TeamOneName = match.TeamOneName,
            TeamTwoName = match.TeamTwoName,
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

    private SummaryV2 CreateSummaryV2(Match match)
    {
        var summary = new SummaryV2
        {
            CreatorUserId = match.UserId,
            StartedAtUtc = Timestamp.FromDateTime(match.CreatedAt),
            CompletedAtUtc = Timestamp.FromDateTime(match.CompletedAt),
            Duration = Duration.FromTimeSpan(match.CompletedAt - match.CreatedAt),
            Format = match.Format switch
            {
                ApplicationFormat.TiebreakToTen => Format.TiebreakToTen,
                ApplicationFormat.BestOfOne => Format.BestOfOne,
                ApplicationFormat.BestOfThree => Format.BestOfThree,
                ApplicationFormat.BestOfFive => Format.BestOfFive,
                ApplicationFormat.BestOfThreeFinalSetTiebreak => Format.BestOfThreeFst,
                ApplicationFormat.BestOfFiveFinalSetTiebreak => Format.BestOfFiveFst,
                ApplicationFormat.FastFour => Format.Fast4,
                ApplicationFormat.LtaCambridgeDoublesLeague => Format.LtaCambridgeDoublesLeague,
                _ => throw new ArgumentOutOfRangeException($"Unexpected Format of {nameof(ApplicationFormat)}")
            },
            MatchId = match.Id,
            TeamOneName = match.TeamOneName,
            TeamTwoName = match.TeamTwoName,
            TeamOneSets = TotalSets(match, ApplicationTeam.TeamOne),
            TeamTwoSets = TotalSets(match, ApplicationTeam.TeamTwo)
        };
        
        summary.TeamOneSetScores.AddRange(GetTeamSetScores(match, ApplicationTeam.TeamOne));
        summary.TeamTwoSetScores.AddRange(GetTeamSetScores(match, ApplicationTeam.TeamTwo));

        return summary;
    }

    private static int TotalSets(Match match, ApplicationTeam team)
    {
        var total = 0;

        if (match.SetOne.Winner == team) total++;
        if (match.SetTwo != null && match.SetTwo.Winner == team) total++;
        if (match.SetThree != null && match.SetThree.Winner == team) total++;
        if (match.SetFour != null && match.SetFour.Winner == team) total++;
        if (match.SetFive != null && match.SetFive.Winner == team) total++;

        return total;
    }

    private static IEnumerable<TeamSetScore> GetTeamSetScores(Match match, ApplicationTeam team)
    {
        for (var set = 1; set <= 5; set++)
        {
            var teamSetScore = GetTeamSetScore(match, team, set);
            
            if (teamSetScore != null) yield return teamSetScore;
        }
    }

    private static TeamSetScore? GetTeamSetScore(Match match, ApplicationTeam team, int setNumber)
    {
        var set = setNumber switch
        {
            1 => match.SetOne,
            2 => match.SetTwo,
            3 => match.SetThree,
            4 => match.SetFour,
            5 => match.SetFive,
            _ => throw new ArgumentException("the set number must be 1-5", nameof(setNumber))
        };

        if (set == null) return null;
        
        return new TeamSetScore
        {
            Games = team == ApplicationTeam.TeamOne ? set.TeamOneGames : set.TeamTwoGames,
            SetNumber = 1,
            SetWon = set.Winner == team,
            TiebreakPoints = team == ApplicationTeam.TeamOne
                ? set.TeamOneTiebreakPoints ?? 0
                : set.TeamTwoTiebreakPoints ?? 0
        };
    }
}