using Matches.Application.DTOs;
using Matches.Application.Abstractions.Messaging;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;
using Match = RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate.Match;

namespace Matches.Application.Commands.CreateMatch;

/// <summary>
/// Handler for CreateMatchCommand
/// </summary>
public class CreateMatchCommandHandler : ICommandHandler<CreateMatchCommand, DTOs.Match>
{
    private readonly IMediator _mediator;
    private readonly ILogger<CreateMatchCommandHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    /// <summary>
    /// Constructor for CreateMatchCommandHandler
    /// </summary>
    public CreateMatchCommandHandler(
        IMediator mediator,
        ILogger<CreateMatchCommandHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    /// <summary>
    /// Handle CreateMatchCommand commands
    /// </summary>
    public async Task<DTOs.Match> Handle(CreateMatchCommand command, CancellationToken cancellationToken)
    {
        // Create match from command
        var playerOne = command.Players[0];
        var playerTwo = command.Players[1];
        var servingFirst = command.ServingFirst == playerOne ? Participant.One : Participant.Two;
        // todo: use new format in Match
        var format = new Format(3, SetType.SixAllAdvantageRule, SetType.SixAllTenPointTiebreaker);
        // todo: static Create method rather than complex constructor
        var match = new Match(playerOne, playerTwo, format, servingFirst);
        _matchRepository.Add(match);
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

        // todo: refactor dtos which could just be domain objects into the domain

        // Convert to DTO
        var matchDto = new DTOs.Match
        {
            Id = match.Id,
            CreatedAt = match.CreatedDateTime.ToString(),
            Players = command.Players,
            ServingFirst = command.ServingFirst,
            Configuration = command.Configuration
        };
        return matchDto;
    }
}