using Microsoft.AspNetCore.Mvc;
using Matches.Presentation.Models;

namespace Matches.Presentation.Controllers
{ 
    /// <summary>
    /// A controller for handling HTTP requests to collections of matches.
    /// </summary>
    [ApiController]
    public class MatchesController : ControllerBase
    { 
        /// <summary>
        /// Create a new match from a configuration.
        /// </summary>
        /// <param name="configuration">Configuration defining the participants and rules of the match.</param>
        /// <response code="201">Successfully created a match with the requested configuration.</response>
        /// <response code="400">The is something wrong with the requested configuration.</response>
        /// <response code="500">An unexpected error occurred while processing the request.</response>
        [HttpPost]
        [Route("/api/v1/matches")]
        [Consumes("application/json")]
        [ProducesResponseType(statusCode: StatusCodes.Status201Created, type: typeof(Match))]
        [ProducesResponseType(statusCode: StatusCodes.Status400BadRequest, type: typeof(Messages))]
        [ProducesResponseType(statusCode: StatusCodes.Status500InternalServerError)]
        public IActionResult CreateMatch([FromBody] MatchConfiguration configuration)
        {
            // return CreatedAtRoute(
            //     routeName: "GetMatch",
            //     routeValues: new { matchId = match.Id },
            //     value: match);
            // return new BadRequestObjectResult(messages);
            // return new NotFoundResult();
            throw new NotImplementedException();
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
        public IActionResult GetMatches(
            [FromQuery (Name = "pageSize")] int? pageSize,
            [FromQuery (Name = "pageNumber")] int? pageNumber,
            [FromQuery (Name = "orderBy")] MatchesOrderByEnum? orderBy
        )
        {
            // return new OkObjectResult(new Paginated<Match>(...));
            // return new BadRequestObjectResult(messages);
            // return new NotFoundResult();
            throw new NotImplementedException();
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
        public IActionResult GetMatchesSummary(
            [FromQuery (Name = "pageSize")] int? pageSize,
            [FromQuery (Name = "pageNumber")] int? pageNumber,
            [FromQuery (Name = "orderBy")] MatchesOrderByEnum? orderBy
        )
        {
            // return new OkObjectResult(new Paginated<MatchWithSummary>(...));
            // return new BadRequestObjectResult(messages);
            // return new NotFoundResult();
            throw new NotImplementedException();
        } 
    }
}