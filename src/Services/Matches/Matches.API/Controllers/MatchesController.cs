using System;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.API.Application.Commands;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Controllers;

[Route("api/v1/[controller]")]
[ApiController]
public class MatchesController : Controller
{
    private readonly IMediator _mediator;
    private readonly ILogger<MatchesController> _logger;

    public MatchesController(IMediator mediator, ILogger<MatchesController> logger)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
    }

    [HttpPost]
    public async Task<ActionResult<Match>> CreateMatch([FromBody] CreateMatchCommand createMatchCommand)
    {
        // Todo: Move logging into the MediatR pipeline
        _logger.LogInformation(
            "Sending command: {CommandName}: {@Command}",
            "CreateMatchCommand", // Todo: Implement a GetGenericTypeName() extension method
            createMatchCommand);

        var commandResult = await _mediator.Send(createMatchCommand);
        return commandResult;
    }
}
