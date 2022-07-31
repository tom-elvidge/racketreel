#nullable disable

using System;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.API.Application.Exceptions;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Commands.DeleteLatestMatchState;

public class DeleteLatestMatchStateCommandHandler : IRequestHandler<DeleteLatestMatchStateCommand, Unit>
{
    private readonly IMatchRepository _matchRepository;
    private readonly IMediator _mediator;
    private readonly ILogger<DeleteLatestMatchStateCommandHandler> _logger;

    public DeleteLatestMatchStateCommandHandler(
        IMatchRepository matchRepository,
        IMediator mediator,
        ILogger<DeleteLatestMatchStateCommandHandler> logger)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
    }

    public async Task<Unit> Handle(DeleteLatestMatchStateCommand command, CancellationToken cancellationToken)
    {
        var match = await _matchRepository.GetAsync(command.MatchId);

        if (match == null)
        {
            throw new NotFoundException(nameof(Match), command.MatchId);
        }

        if (match.States.Count == 1)
        {
            throw new DeleteInitialStateException(command.MatchId);
        }

        match.RemoveLastState();
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        
        return Unit.Value;
    }
}
