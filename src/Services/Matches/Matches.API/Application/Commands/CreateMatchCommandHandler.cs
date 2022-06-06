using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Commands;

public class CreateMatchCommandHandler : IRequestHandler<CreateMatchCommand, Match>
{
    private readonly IMatchRepository _matchRepository;
    private readonly IMediator _mediator;
    private readonly ILogger<CreateMatchCommandHandler> _logger;

    public CreateMatchCommandHandler(IMatchRepository matchRepository,
        IMediator mediator,
        ILogger<CreateMatchCommandHandler> logger)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
    }

    public async Task<Match> Handle(CreateMatchCommand request, CancellationToken cancellationToken)
    {
        _logger.LogInformation("Creating match with stes: {@Sets}", request.Sets);

        Enum.TryParse<SetType>(request.SetType, out var setType);
        Enum.TryParse<SetType>(request.FinalSetType, out var finalSetType);
        var format = new Format(request.Sets, setType, finalSetType);

        var players = request.Players.ToList();
        var playerOne = players[0];
        var playerTwo = players[1];

        var servingFirst = request.ServingFirst == playerOne ? 0 : 1;
        
        var match = new Match(playerOne, playerTwo, format, servingFirst);

        _logger.LogInformation("Creating Match: {@Match}", match);

        _matchRepository.Add(match);
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

        // Todo: Transform match to DTO and return

        return match;
    }
}
