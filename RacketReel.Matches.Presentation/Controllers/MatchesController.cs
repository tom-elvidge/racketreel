using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RacketReel.Matches.Generated.Server.Controllers;
using RacketReel.Matches.Generated.Server.Models;

namespace RacketReel.Matches.Presentation.Controllers;

class MatchesController : MatchesApiController
{
    public override Task<IActionResult> CreateMatch([FromBody] CreateMatchRequest createMatchRequest)
    {
        throw new System.NotImplementedException();
    }

    public override Task<IActionResult> ListMatches([FromQuery(Name = "pageSize")] int? pageSize, [FromQuery(Name = "pageNumber")] int? pageNumber)
    {
        throw new System.NotImplementedException();
    }
}