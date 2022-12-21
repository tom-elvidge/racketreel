using Microsoft.AspNetCore.Mvc;
using Matches.Application.DTOs;
using MediatR;
using Matches.Application.Commands.CreateState;
using Matches.Application.RequestBodies;
using Matches.Application.Errors;

namespace Matches.Presentation.Controllers;

[ApiController]
public class StatesController : ApiController
{
    public StatesController(ISender sender) : base(sender)
    {
    }

    /// <summary>
    /// Create a new match state when a participant scores a point.
    /// </summary>
    /// <param name="matchId">The id of the match to create a state for.</param>
    /// <param name="body">The request body which should specify the participant which scored the point.</param>
    /// <param name="cancellationToken"></param>
    /// <response code="201">Successfully created a new state in the match.</response>
    /// <response code="400">There is something wrong with the request.</response>
    /// <response code="404">The match with id does not exist.</response>
    /// <response code="409">The match has been completed so no new states can be added.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpPost]
    [Route("/api/v1/matches/{matchId}/states")]
    [Consumes("application/json")]
    [ProducesResponseType(statusCode: StatusCodes.Status201Created, type: typeof(State))]
    [ProducesResponseType(statusCode: StatusCodes.Status400BadRequest, type: typeof(ProblemDetails))]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound)]
    [ProducesResponseType(statusCode: StatusCodes.Status409Conflict)]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> CreateState(
        [FromRoute] int matchId,
        [FromBody] CreateStateRequestBody body,
        CancellationToken cancellationToken)
    {
        var command = new CreateStateCommand(matchId, body.Participant);
        var result = await Sender.Send(command, cancellationToken);

        if (result.IsSuccess)
            return Created($"/api/v1/matches/{matchId}/states/{result.Value.Item2}", result.Value.Item1);

        if (result.Error == ApplicationErrors.UpdateCompletedMatch)
        {
            return Conflict(
                CreateProblemDetails(
                    StatusCodes.Status409Conflict,
                    result.Error
                ));
        }

        return HandleFailure(result);
    }
}