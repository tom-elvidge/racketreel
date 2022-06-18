using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.API.Application.Dtos;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Commands;

public class NewMatchStateCommandHandler : IRequestHandler<NewMatchStateCommand, StateDto>
{
    private readonly IMatchRepository _matchRepository;
    private readonly IMediator _mediator;
    private readonly ILogger<NewMatchStateCommandHandler> _logger;

    public NewMatchStateCommandHandler(
        IMatchRepository matchRepository,
        IMediator mediator,
        ILogger<NewMatchStateCommandHandler> logger)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
    }

    public async Task<StateDto> Handle(NewMatchStateCommand request, CancellationToken cancellationToken)
    {
        _logger.LogInformation("adding state to existing match");
        var match = await _matchRepository.GetAsync(request.MatchId);

        int pointTo = request.PointTo == match.ParticipantOne ? 0 : 1;
        match.AddState(pointTo);
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

        var newState = match.GetLatestState();
        return StateDto.ConvertToDto(match, newState);
    }
}
