#nullable disable

using System;
using System.Threading.Tasks;
using FluentValidation;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Services.Matches.API.Application.Exceptions;
using RacketReel.Services.Matches.API.Application.Dtos;
using RacketReel.Services.Matches.API.Application.Commands.CreateMatchState;
using RacketReel.Services.Matches.API.Application.Commands.DeleteLatestMatchState;
using RacketReel.Services.Matches.API.Application.Commands.CreateMatch;
using System.Linq;
using System.Collections.Generic;
using RacketReel.Services.Matches.API.Application.Filters;

namespace RacketReel.Services.Matches.API.Controllers;

[Route("api/v1/matches")]
[ApiController]
public class MatchesController : Controller
{
    private readonly IMatchRepository _matchRepository;
    private readonly IMediator _mediator;

    public MatchesController(IMatchRepository matchRepository, IMediator mediator)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
    }

    [HttpGet(Name = "GetMatches")]
    public async Task<ActionResult> GetMatchesAsync([FromQuery] PaginationFilter filter)
    {
        // todo: validate and throw exceptions instead
        var validFilter = new PaginationFilter(filter.PageNumber, filter.PageSize);

        var matches = await _matchRepository.GetAsync(validFilter.PageNumber, validFilter.PageSize, false);
        
        if (matches.Count() == 0)
        {
            return NotFound();
        }

        return Ok(new PagedResponse<IEnumerable<MatchDto>>(matches.Select(m => MatchDto.ConvertToDto(m)), validFilter.PageNumber, validFilter.PageSize));
    }

    [HttpPost(Name = "CreateMatch")]
    public async Task<ActionResult> CreateMatchAsync([FromBody] CreateMatchCommand command)
    {
        // Todo: Auth so only registered users can create matches
        try
        {
            var match = await _mediator.Send(command);
            return CreatedAtRoute(
                routeName: "GetMatch",
                routeValues: new { matchId = match.Id },
                value: new Response<MatchDto>(match));
        }
        catch (ValidationException e)
        {
            return BadRequest(new Response<MatchDto>(e.Message.Split("; ")));
        }
    }

    [HttpGet("{matchId:int}", Name = "GetMatch")]
    public async Task<ActionResult> GetMatchAsync([FromRoute] int matchId)
    {
        var match = await _matchRepository.GetAsync(matchId);
        if (match == null) return NotFound();

        return Ok(new Response<MatchDto>(MatchDto.ConvertToDto(match)));
    }

    [HttpPost("{matchId:int}/states", Name = "CreateMatchState")]
    public async Task<ActionResult> CreateMatchStateAsync([FromRoute] int matchId, [FromBody] CreateMatchStateCommand command)
    {
        // Todo: Auth so only creator can update the match
        command.MatchId = matchId;
        try
        {
            var match = await _mediator.Send(command);
            return CreatedAtRoute(
                routeName: "GetMatchState",
                routeValues: new { matchId = matchId, stateIndex = match.StateIndex },
                value: new Response<StateDto>(match.State));
        }
        catch (ValidationException e)
        {
            return BadRequest(new Response<StateDto>(e.Message.Split("; ")));
        }
        catch (NotFoundException e)
        {
            return NotFound(new Response<StateDto>(new string[] { e.Message }));
        }
    }

    [HttpGet("{matchId:int}/states/{stateIndex:int}", Name = "GetMatchState")]
    public async Task<ActionResult> GetMatchStateAsync([FromRoute] int matchId, [FromRoute] int stateIndex)
    {
        var match = await _matchRepository.GetAsync(matchId);
        if (match == null)  return NotFound();

        try
        {
            var state = match.GetStateByIndex(stateIndex);
             return Ok(new Response<StateDto>(StateDto.ConvertToDto(match, state)));
        }
        catch (ArgumentOutOfRangeException)
        {
            return NotFound();
        }
    }

    [HttpGet("{matchId:int}/states/latest", Name = "GetLatestMatchState")]
    public async Task<ActionResult> GetLatestMatchStateAsync([FromRoute] int matchId)
    {
        var match = await _matchRepository.GetAsync(matchId);
        if (match == null) return NotFound();

        var state = match.GetLatestState();
        if (state == null) return NotFound();

        return Ok(new Response<StateDto>(StateDto.ConvertToDto(match, state)));
    }

    [HttpDelete("{matchId:int}/states/latest", Name = "DeleteLatestMatchState")]
    public async Task<ActionResult> DeleteLatestMatchStateAsync([FromRoute] int matchId)
    {
        var command = new DeleteLatestMatchStateCommand(matchId);
        try
        {
            // todo: return the deleted state?
            await _mediator.Send(command);
            return Ok();
        }
        catch (ValidationException e)
        {
            return BadRequest(new Response<StateDto>( e.Message.Split("; ")));
        }
        catch (NotFoundException e)
        {
            return NotFound(new Response<StateDto>(new string[] { e.Message }));
        }
        catch (DeleteInitialStateException e)
        {
            return Conflict(new Response<StateDto>(new string[] { e.Message }));
        }
    }
}
