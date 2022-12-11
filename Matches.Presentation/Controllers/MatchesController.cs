using Microsoft.AspNetCore.Mvc;
using Matches.Application.DTOs;
using Matches.Application.Commands.CreateMatch;
using MediatR;
using Matches.Application.Queries.GetMatches;
using Matches.Application.Queries.GetMatchesWithSummaries;

namespace Matches.Presentation.Controllers;

/// <summary>
/// A controller for handling HTTP requests to collections of matches.
/// </summary>
[ApiController]
public class MatchesController : ControllerBase
{ 
    private readonly ISender _sender;

    /// <summary>
    /// Constructor for MatchesController.
    /// </summary>
    public MatchesController(ISender sender)
    {
        _sender = sender;
    }    

    /// <summary>
    /// Create a new match from a configuration.
    /// </summary>
    /// <param name="command">Configuration defining the participants and rules of the match.</param>
    /// <param name="cancellationToken"></param>
    /// <response code="201">Successfully created a match with the requested configuration.</response>
    /// <response code="400">The is something wrong with the requested configuration.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpPost]
    [Route("/api/v1/matches")]
    [Consumes("application/json")]
    [ProducesResponseType(statusCode: StatusCodes.Status201Created, type: typeof(Match))]
    [ProducesResponseType(statusCode: StatusCodes.Status400BadRequest, type: typeof(Messages))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> CreateMatch([FromBody] CreateMatchCommand command, CancellationToken cancellationToken)
    {
        // return new BadRequest(messages);
        // return new NotFound();
        var match = await _sender.Send(command, cancellationToken);
        return Created($"/api/v1/matches/{match.Id}", match);
    }

    /// <summary>
    /// Get a page of matches from the collection of all ordered matches.
    /// </summary>
    /// <param name="pageSize">The maximum number of matches to include on a page.</param>
    /// <param name="pageNumber">The page of matches to get.</param>
    /// <param name="orderBy">How to order the collection of matches.</param>
    /// <response code="200">The requested page of matches.</response>
    /// <response code="400">The was something wrong with the request.</response>
    /// <response code="404">The requested page of matches does not exist.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpGet]
    [Route("/api/v1/matches")]
    [ProducesResponseType(statusCode: StatusCodes.Status200OK, type: typeof(Paginated<Match>))]
    [ProducesResponseType(statusCode: StatusCodes.Status400BadRequest, type: typeof(Messages))]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(Message))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> GetMatches(
        [FromQuery (Name = "pageSize")] int? pageSize,
        [FromQuery (Name = "pageNumber")] int? pageNumber,
        [FromQuery (Name = "orderBy")] MatchesOrderByEnum? orderBy
    )
    {
        // return new BadRequest(messages);
        // return new NotFound();
        var query = new GetMatchesQuery(pageSize, pageNumber, orderBy);
        var paginatedMatches = await _sender.Send(query);
        return Ok(paginatedMatches);
    }

    /// <summary>
    /// Get a page of matches with their respective summary from the collection of all ordered completed matches.
    /// </summary>
    /// <param name="pageSize">The maximum number of matches to include on a page.</param>
    /// <param name="pageNumber">The page of matches to get.</param>
    /// <param name="orderBy">How to order the collection of matches.</param>
    /// <response code="200">The requested page of matches.</response>
    /// <response code="400">The was something wrong with the request.</response>
    /// <response code="404">The requested page of matches does not exist.</response>
    /// <response code="500">An unexpected error occurred while processing the request.</response>
    [HttpGet]
    [Route("/api/v1/matches/summary")]
    [ProducesResponseType(statusCode: StatusCodes.Status200OK, type: typeof(Paginated<MatchWithSummary>))]
    [ProducesResponseType(statusCode: StatusCodes.Status400BadRequest, type: typeof(Messages))]
    [ProducesResponseType(statusCode: StatusCodes.Status404NotFound, type: typeof(Message))]
    [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> GetMatchesSummary(
        [FromQuery (Name = "pageSize")] int? pageSize,
        [FromQuery (Name = "pageNumber")] int? pageNumber,
        [FromQuery (Name = "orderBy")] MatchesOrderByEnum? orderBy
    )
    {
        // return new BadRequest(messages);
        // return new NotFound();
        var query = new GetMatchesWithSummariesQuery(pageSize, pageNumber, orderBy);
        var paginatedMatchesWithSummaries = await _sender.Send(query);
        return Ok(paginatedMatchesWithSummaries);
    } 
}