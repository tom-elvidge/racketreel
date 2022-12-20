using Microsoft.AspNetCore.Mvc;
using Matches.Application.DTOs;
using MediatR;
using Matches.Application.Queries.GetMatchById;

namespace Matches.Presentation.Controllers;

/// <summary>
/// A controller for handling HTTP requests to the match resource.
/// </summary>
[ApiController]
public class MatchController : ApiController
{ 
    public MatchController(ISender sender) : base(sender)
    {
    }

    /// <summary>
    /// Get the match with id.
    /// </summary>
    /// <param name="matchId">The id of the match to get.</param>
    /// <response code="200">The match with id.</response>
    /// <response code="404">The match with id does not exist.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpGet]
    [Route("/api/v1/matches/{matchId:int}")]
    [ProducesResponseType(statusCode: StatusCodes.Status200OK, type: typeof(MatchDTO))]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(Message))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> GetMatch([FromRoute] int matchId)
    {
        var query = new GetMatchByIdQuery(matchId);
        var result = await Sender.Send(query);

        if (result.IsSuccess)
            return Ok(result.Value);

        return HandleFailure(result);
    }

    /// <summary>
    /// Delete the match with id.
    /// </summary>
    /// <param name="matchId">The id of the match to delete.</param>
    /// <response code="200">The match with id was deleted.</response>
    /// <response code="404">The match with id does not exist.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpDelete]
    [Route("/api/v1/matches/{matchId:int}")]
    [ProducesResponseType(statusCode: StatusCodes.Status200OK)]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(Message))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> DeleteMatch([FromRoute] int matchId)
    {
        // return NotFound();
        // var command = DeleteMatch(matchId);
        // await _sender.Send(command);
        // return Ok();
        throw new NotImplementedException();
    }

    /// <summary>
    /// Get the summary of the match with id. The match must have been completed to have a summary.
    /// </summary>
    /// <param name="matchId">The id of the match to get the summary of.</param>
    /// <response code="200">The summary of the match with id.</response>
    /// <response code="404">The match with id does not exist.</response>
    /// <response code="405">Not allowed because the match with id has not been completed.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpGet]
    [Route("/api/v1/matches/{matchId:int}/summary")]
    [ProducesResponseType(statusCode: StatusCodes.Status200OK, type: typeof(MatchDTO))]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(Message))]
    [ProducesResponseType(statusCode: StatusCodes.Status405MethodNotAllowed, type: typeof(Message))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> GetMatchSummary([FromRoute] int matchId)
    {
        throw new NotImplementedException();
    }
}