using Microsoft.AspNetCore.Mvc;
using Matches.Application.DTOs;
using MediatR;
using Matches.Application.Commands.CreateState;
using Matches.Application.RequestBodies;
using Matches.Application.Errors;
using Matches.Application.Queries.GetStateByIndex;
using Matches.Application.Queries.GetLatestState;
using Matches.Application.Commands.UpdateState;
using Matches.Application.Commands.UpdateLatestState;
using Matches.Application.Commands.DeleteLatestState;

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
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(ProblemDetails))]
    [ProducesResponseType(statusCode: StatusCodes.Status409Conflict, type: typeof(ProblemDetails))]
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

    /// <summary>
    /// Get the state with index stateIndex from the match with id matchId.
    /// </summary>
    /// <param name="matchId">The id of the match to get the state from.</param>
    /// <param name="stateIndex">The index of state in the match to get.</param>
    /// <param name="cancellationToken"></param>
    /// <response code="200">The requested state.</response>
    /// <response code="404">Either the state or match does not exist.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpGet]
    [Route("/api/v1/matches/{matchId:int}/states/{stateIndex:int}")]
    [ProducesResponseType(statusCode: StatusCodes.Status200OK, type: typeof(State))]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(ProblemDetails))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> GetState([FromRoute] int matchId, [FromRoute] int stateIndex, CancellationToken cancellationToken)
    {
        var query = new GetStateByIndexQuery(matchId, stateIndex);
        var result = await Sender.Send(query, cancellationToken);

        if (result.IsSuccess)
            return Ok(result.Value);

        return HandleFailure(result);
    }

    /// <summary>
    /// Get the latest state from the match with id matchId.
    /// </summary>
    /// <param name="matchId">The id of the match to get the latest state from.</param>
    /// <param name="cancellationToken"></param>
    /// <response code="200">The requested state.</response>
    /// <response code="404">The match with id does not exist.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpGet]
    [Route("/api/v1/matches/{matchId:int}/states/latest")]
    [ProducesResponseType(statusCode: StatusCodes.Status200OK, type: typeof(State))]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(ProblemDetails))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> GetLatestState([FromRoute] int matchId, CancellationToken cancellationToken)
    {
        var query = new GetLatestStateQuery(matchId);
        var result = await Sender.Send(query, cancellationToken);

        if (result.IsSuccess)
            return Ok(result.Value);

        return HandleFailure(result);
    }

    /// <summary>
    /// Update the state with index stateIndex from the match with id matchId.
    /// </summary>
    /// <param name="matchId">The id of the match to update the state from.</param>
    /// <param name="stateIndex">The index of state in the match to update.</param>
    /// <param name="cancellationToken"></param>
    /// <param name="body"></param>
    /// <response code="200">The state was updated successfully.</response>
    /// <response code="404">Either the state or match does not exist.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpPut]
    [Route("/api/v1/matches/{matchId:int}/states/{stateIndex:int}")]
    [ProducesResponseType(statusCode: StatusCodes.Status200OK, type: typeof(State))]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(ProblemDetails))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> UpdateState(
        [FromRoute] int matchId,
        [FromRoute] int stateIndex,
        [FromBody] UpdateStateRequestBody body,
        CancellationToken cancellationToken)
    {
        var query = new UpdateStateCommand(matchId, stateIndex, body.Highlight);
        var result = await Sender.Send(query, cancellationToken);

        if (result.IsSuccess)
            return Ok();

        return HandleFailure(result);
    }

    /// <summary>
    /// Update the latest state from the match with id matchId.
    /// </summary>
    /// <param name="matchId">The id of the match to update the state from.</param>
    /// <param name="cancellationToken"></param>
    /// <param name="body"></param>
    /// <response code="200">The state was updated successfully.</response>
    /// <response code="404">Either the state or match does not exist.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpPut]
    [Route("/api/v1/matches/{matchId:int}/states/latest")]
    [ProducesResponseType(statusCode: StatusCodes.Status200OK, type: typeof(State))]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(ProblemDetails))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> UpdateLatestState(
        [FromRoute] int matchId,
        [FromBody] UpdateStateRequestBody body,
        CancellationToken cancellationToken)
    {
        var query = new UpdateLatestStateCommand(matchId, body.Highlight);
        var result = await Sender.Send(query, cancellationToken);

        if (result.IsSuccess)
            return Ok();

        return HandleFailure(result);
    }

    /// <summary>
    /// Delete the latest state from the match with id matchId.
    /// </summary>
    /// <param name="matchId">The id of the match to update the state from.</param>
    /// <param name="cancellationToken"></param>
    /// <response code="200">The state was updated successfully.</response>
    /// <response code="404">Either the state or match does not exist.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpDelete]
    [Route("/api/v1/matches/{matchId:int}/states/latest")]
    [ProducesResponseType(statusCode: StatusCodes.Status200OK)]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(ProblemDetails))]
    [ProducesResponseType(statusCode: StatusCodes.Status409Conflict, type: typeof(ProblemDetails))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> DeleteLatestState(
        [FromRoute] int matchId,
        CancellationToken cancellationToken)
    {
        var command = new DeleteLatestStateCommand(matchId);
        var result = await Sender.Send(command, cancellationToken);

        if (result.IsSuccess)
            return Ok();

        if (result.Error == ApplicationErrors.DeleteInitialState)
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