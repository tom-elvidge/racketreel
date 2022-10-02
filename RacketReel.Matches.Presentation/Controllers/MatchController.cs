using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RacketReel.Matches.Generated.Server.Controllers;
using RacketReel.Matches.Generated.Server.Models;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Matches.Presentation.Controllers;

class MatchController : MatchApiController
{

    private readonly IMatchRepository _matchRepository;
    public MatchController(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public override async Task<IActionResult> CreateMatchState([FromRoute, Required] int matchId, [FromBody] CreateMatchStateRequest createMatchStateRequest)
    {
        // Todo: Auth so only creator can update the match
        var match = await _matchRepository.GetAsync(matchId);
        
        if (match == null)
        {
            return new NotFoundResult();
        }

        var players = new List<string>() { match.ParticipantOne, match.ParticipantTwo };
        if (!players.Contains(createMatchStateRequest.PointTo))
        {
            return new BadRequestObjectResult(new Error{
                Message = $"'{createMatchStateRequest.PointTo}' is not a participant in the match"
            });
        }

        Participant pointTo = createMatchStateRequest.PointTo == match.ParticipantOne ? Participant.One : Participant.Two;
        match.AddState(pointTo);
        await _matchRepository.UnitOfWork.SaveEntitiesAsync();

        var state = match.GetLatestState();
        var stateIndex = match.States.Count();
        
        return CreatedAtRoute(
            routeName: "GetMatchState",
            routeValues: new { matchId = matchId, stateIndex = stateIndex },
            value: new Generated.Server.Models.State
            {
                CreatedDateTime = state.CreatedDateTime.ToString(),
                Serving = state.Serving == Participant.One ? match.ParticipantOne : match.ParticipantTwo,
                Score = new Dictionary<string, Generated.Server.Models.PlayerScore>()
                {
                    {
                        match.ParticipantOne,
                        new PlayerScore
                        {
                            Points = state.Score.ParticipantOnePoints,
                            Games = state.Score.ParticipantOneGames,
                            Sets = state.Score.ParticipantOneSets
                        }
                    },
                    {
                        match.ParticipantOne,
                        new PlayerScore
                        {
                            Points = state.Score.ParticipantTwoPoints,
                            Games = state.Score.ParticipantTwoGames,
                            Sets = state.Score.ParticipantTwoSets
                        }
                    }
                }
            }
        );
    }

    public override Task<IActionResult> DeleteLatestMatchState([FromRoute, Required] int matchId)
    {
        throw new NotImplementedException();
    }

    public override Task<IActionResult> GetLatestMatchState([FromRoute, Required] int matchId)
    {
        throw new NotImplementedException();
    }

    public override Task<IActionResult> GetMatch([FromRoute, Required] int matchId)
    {
        throw new NotImplementedException();
    }

    public override Task<IActionResult> GetMatchState([FromRoute, Required] int matchId, [FromRoute, Required] int stateId)
    {
        throw new NotImplementedException();
    }
}