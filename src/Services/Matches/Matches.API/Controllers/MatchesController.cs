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

    [HttpPost(Name = "CreateMatch")]
    public async Task<ActionResult> CreateMatchAsync([FromBody] CreateMatchCommand command)
    {
        try
        {
            var response = await _mediator.Send(command);
            return CreatedAtRoute(
                routeName: "GetMatch",
                routeValues: new { matchId = response.Id },
                value: response);
        }
        catch (ValidationException e)
        {
            return BadRequest(new ErrorsDto { Errors = e.Message.Split("; ") });
        }
    }

    [HttpGet("{matchId:int}", Name = "GetMatch")]
    public async Task<ActionResult> GetMatchAsync([FromRoute] int matchId)
    {
        var match = await _matchRepository.GetAsync(matchId);
        if (match == null) return NotFound();

        return Ok(MatchDto.ConvertToDto(match));
    }

    [HttpPost("{matchId:int}/states", Name = "CreateMatchState")]
    public async Task<ActionResult> CreateMatchStateAsync([FromRoute] int matchId, [FromBody] CreateMatchStateCommand command)
    {
        command.MatchId = matchId;
        try
        {
            var response = await _mediator.Send(command);
            return CreatedAtRoute(
                routeName: "GetMatchState",
                routeValues: new { matchId = matchId, stateIndex = response.StateIndex },
                value: response.State);
        }
        catch (ValidationException e)
        {
            return BadRequest(new ErrorsDto { Errors = e.Message.Split("; ") });
        }
        catch (NotFoundException e)
        {
            return NotFound(new ErrorsDto { Errors = new string[] { e.Message } } );
        }
    }

    [HttpGet("{matchId:int}/states/{stateIndex:int}", Name = "GetMatchState")]
    public async Task<ActionResult> GetMatchStateAsync([FromRoute] int matchId, [FromRoute] int stateIndex)
    {
        var match = await _matchRepository.GetAsync(matchId);
        if (match == null)  return NotFound();

        var state = match.GetStateByIndex(stateIndex);
        if (state == null) return NotFound();

        return Ok(StateDto.ConvertToDto(match, state));
    }

    [HttpGet("{matchId:int}/states/latest", Name = "GetLatestMatchState")]
    public async Task<ActionResult> GetLatestMatchStateAsync([FromRoute] int matchId)
    {
        var match = await _matchRepository.GetAsync(matchId);
        if (match == null) return NotFound();

        var state = match.GetLatestState();
        if (state == null)return NotFound();

        return Ok(StateDto.ConvertToDto(match, state));
    }

    [HttpDelete("{matchId:int}/states/latest", Name = "DeleteLatestMatchState")]
    public async Task<ActionResult> DeleteLatestMatchStateAsync([FromRoute] int matchId)
    {
        var command = new DeleteLatestMatchStateCommand(matchId);
        try
        {
            await _mediator.Send(command);
            return Ok();
        }
        catch (ValidationException e)
        {
            return BadRequest(new ErrorsDto { Errors = e.Message.Split("; ") });
        }
        catch (NotFoundException e)
        {
            return NotFound(new ErrorsDto { Errors = new string[] { e.Message } });
        }
        catch (DeleteInitialStateException e)
        {
            return Conflict(new ErrorsDto { Errors = new string[] { e.Message } });
        }
    }
}
