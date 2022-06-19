using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.API.Application.Dtos;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Commands;

public class CreateMatchCommandHandler : IRequestHandler<CreateMatchCommand, MatchDto>
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

    public async Task<MatchDto> Handle(CreateMatchCommand command, CancellationToken cancellationToken)
    {
        Enum.TryParse<SetType>(command.SetType, out var setType);
        Enum.TryParse<SetType>(command.FinalSetType, out var finalSetType);
        var format = new Format(command.Sets, setType, finalSetType);

        var players = command.Players.ToList();
        var playerOne = players[0];
        var playerTwo = players[1];

        var servingFirst = command.ServingFirst == playerOne ? 0 : 1;
        
        var match = new Match(playerOne, playerTwo, format, servingFirst);

        _matchRepository.Add(match);
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

        return MatchDto.ConvertToDto(match);
    }
}
