using System;
using System.Net;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.API.Application.Commands;
using RacketReel.Services.Matches.API.Application.Dtos;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Controllers;

[Route("api/v1/[controller]")]
[ApiController]
public class MatchesController : Controller
{
    private readonly IMatchRepository _matchRepository;
    private readonly IMediator _mediator;
    private readonly ILogger<MatchesController> _logger;

    public MatchesController(IMatchRepository matchRepository, IMediator mediator, ILogger<MatchesController> logger)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
    }

    [HttpPost]
    public async Task<ActionResult<MatchDto>> CreateMatchAsync([FromBody] CreateMatchCommand createMatchCommand)
    {
        // Todo: Move logging into the MediatR pipeline
        _logger.LogInformation(
            "Sending command: {CommandName}: {@Command}",
            "CreateMatchCommand", // Todo: Implement a GetGenericTypeName() extension method
            createMatchCommand);

        var commandResult = await _mediator.Send(createMatchCommand);
        return commandResult;
    }

    [Route("{matchId:int}")]
    [HttpGet]
    [ProducesResponseType(typeof(MatchDto), (int)HttpStatusCode.OK)]
    [ProducesResponseType((int)HttpStatusCode.NotFound)]
    public async Task<ActionResult> GetMatchAsync([FromRoute] int matchId)
    {
        // Todo: Move these into queries following CQRS
        var match = await _matchRepository.GetAsync(matchId);

        if (match == null)
        {
            return NotFound();
        }

        return Ok(MatchDto.ConvertToDto(match));
    }

    [Route("{matchId:int}/states")]
    [HttpPost]
    public async Task<ActionResult<StateDto>> NewMatchStateAsync([FromRoute] int matchId, [FromBody] NewMatchStateCommand newMatchStateCommand)
    {
        // Todo: Look into hybrid model binding
        newMatchStateCommand.MatchId = matchId;

        // Todo: Move logging into the MediatR pipeline
        _logger.LogInformation(
            "Sending command: {CommandName}: {@Command}",
            "NewMatchStateCommand", // Todo: Implement a GetGenericTypeName() extension method
            newMatchStateCommand);

        var commandResult = await _mediator.Send(newMatchStateCommand);
        return commandResult;
    }


    [Route("{matchId:int}/states/latest")]
    [HttpGet]
    [ProducesResponseType(typeof(StateDto), (int)HttpStatusCode.OK)]
    [ProducesResponseType((int)HttpStatusCode.NotFound)]
    public async Task<ActionResult> GetLatestMatchState([FromRoute] int matchId)
    {
        var match = await _matchRepository.GetAsync(matchId);
        if (match == null)
        {
            return NotFound();
        }

        var state = match.GetLatestState();
        if (state == null)
        {
            return NotFound();
        }

        return Ok(StateDto.ConvertToDto(match, state));
    }

    [Route("{matchId:int}/states/{stateIndex:int}")]
    [HttpGet]
    [ProducesResponseType(typeof(StateDto), (int)HttpStatusCode.OK)]
    [ProducesResponseType((int)HttpStatusCode.NotFound)]
    public async Task<ActionResult> GetLatestMatchState([FromRoute] int matchId, [FromRoute] int stateIndex)
    {
        var match = await _matchRepository.GetAsync(matchId);
        if (match == null)
        {
            return NotFound();
        }

        var state = match.GetStateByIndex(stateIndex);
        if (state == null)
        {
            return NotFound();
        }

        return Ok(StateDto.ConvertToDto(match, state));
    }
}
