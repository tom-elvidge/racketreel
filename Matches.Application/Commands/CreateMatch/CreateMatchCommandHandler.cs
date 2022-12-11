using Matches.Application.DTOs;
using Matches.Application.Abstractions.Messaging;
using MediatR;
using Microsoft.Extensions.Logging;

namespace Matches.Application.Commands.CreateMatch;

/// <summary>
/// Handler for CreateMatchCommand
/// </summary>
public class CreateMatchCommandHandler : ICommandHandler<CreateMatchCommand, Match>
{
    private readonly IMediator _mediator;
    private readonly ILogger<CreateMatchCommandHandler> _logger;

    /// <summary>
    /// Constructor for CreateMatchCommandHandler
    /// </summary>
    public CreateMatchCommandHandler(
        IMediator mediator,
        ILogger<CreateMatchCommandHandler> logger)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
    }

    /// <summary>
    /// Handle CreateMatchCommand commands
    /// </summary>
    public async Task<Match> Handle(CreateMatchCommand command, CancellationToken cancellationToken)
    {
        // var playerOne = command.Players[0];
        // var playerTwo = command.Players[1];
        // var servingFirst = command.ServingFirst == playerOne ? Participant.One : Participant.Two;
        // var match = new Match(playerOne, playerTwo, format, servingFirst);
        // _matchRepository.Add(match);
        // await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        // return MatchDto.ConvertToDto(match);
        Console.WriteLine("hello");
        return new Match();
    }
}