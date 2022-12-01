using System;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.API.Application.Dtos;
using RacketReel.Services.Matches.API.Application.Exceptions;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Commands.CreateMatch;

public class UpdateMatchStateCommandHandler : IRequestHandler<UpdateMatchStateCommand, StateDto>
{
    private readonly IMatchRepository _matchRepository;
    private readonly IMediator _mediator;
    private readonly ILogger<UpdateMatchStateCommandHandler> _logger;

    public UpdateMatchStateCommandHandler(
        IMatchRepository matchRepository,
        IMediator mediator,
        ILogger<UpdateMatchStateCommandHandler> logger)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
    }

    public async Task<StateDto> Handle(UpdateMatchStateCommand command, CancellationToken cancellationToken)
    {
        var match = await _matchRepository.GetAsync(matchId: command.MatchId, includeStates: true);

        if (match == null)
        {
            throw new NotFoundException(nameof(Match), command.MatchId);
        }

        State state;
        if (command.StateIndex == null)
        {
            if (match.States.Count == 1)
            {
                throw new UpdateInitialStateException(command.MatchId);
            }
            state = match.GetLatestState();
        }
        else
        {
            state = match.GetStateByIndex((int)command.StateIndex);
        }

        if (state == null)
        {
            throw new NotFoundException(nameof(State), command.StateIndex);
        }

        state.Highlight = command.Highlight;
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        return StateDto.ConvertToDto(match, state);
    }
}