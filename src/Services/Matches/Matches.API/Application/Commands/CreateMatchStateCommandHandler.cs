using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using FluentValidation;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.API.Application.Dtos;
using RacketReel.Services.Matches.API.Application.Exceptions;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Commands;

public class CreateMatchStateCommandHandler : IRequestHandler<CreateMatchStateCommand, CreateMatchStateCommandResponse>
{
    private readonly IMatchRepository _matchRepository;
    private readonly IMediator _mediator;
    private readonly ILogger<CreateMatchStateCommandHandler> _logger;

    public CreateMatchStateCommandHandler(
        IMatchRepository matchRepository,
        IMediator mediator,
        ILogger<CreateMatchStateCommandHandler> logger)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
    }

    public async Task<CreateMatchStateCommandResponse> Handle(CreateMatchStateCommand command, CancellationToken cancellationToken)
    {
        var match = await _matchRepository.GetAsync(command.MatchId);
        
        if (match == null)
        {
            throw new NotFoundException(nameof(Match), command.MatchId);
        }

        var players = new List<string>() { match.ParticipantOne, match.ParticipantTwo };
        if (!players.Contains(command.PointTo))
        {
            throw new ValidationException($"'{command.PointTo}' is not a participant in the match");
        }

        int pointTo = command.PointTo == match.ParticipantOne ? 0 : 1;
        match.AddState(pointTo);
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

        var state = match.GetLatestState();
        var stateIndex = match.States.Count();

        return new CreateMatchStateCommandResponse(StateDto.ConvertToDto(match, state), stateIndex);
    }
}
