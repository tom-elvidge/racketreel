using Matches.Application.DTOs;
using Matches.Application.Abstractions.Messaging;
using MediatR;
using Microsoft.Extensions.Logging;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.AggregatesModel.MatchAggregate.Formats;
using Matches.Domain.AggregatesModel.MatchAggregate.Participants;
using Matches.Domain.SeedWork;

namespace Matches.Application.Commands.CreateMatch;

/// <summary>
/// Handler for CreateMatchCommand
/// </summary>
public class CreateMatchCommandHandler : ICommandHandler<CreateMatchCommand, MatchDTO>
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
    public async Task<Result<MatchDTO>> Handle(CreateMatchCommand command, CancellationToken cancellationToken)
    {
        var playerOne = command.Players[0];
        var playerTwo = command.Players[1];
        var servingFirst = command.ServingFirst == playerOne ? ParticipantEnum.One : ParticipantEnum.Two;

        // todo: move to validation
        Format format;
        try
        {
            format = CreateFormat(command.Format);
        }
        catch (ApplicationException)
        {
            return Result.Failure<MatchDTO>(new Error("CreateMatch.UnknownFormat", $"Unknown format {command.Format}"));
        }

        var match = Match.Create(
            new NoUserParticipant(playerOne),
            new NoUserParticipant(playerTwo),
            servingFirst,
            format);

        _matchRepository.Add(match);
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

        var dto = new MatchDTO
        {
            Id = match.Id,
            CreatedAt = match.CreatedAtDateTime.ToString(),
            Players = command.Players,
            ServingFirst = command.ServingFirst,
            Format = command.Format
        };

        return Result.Success<MatchDTO>(dto);
    }

    private Format CreateFormat(MatchFormatEnum format)
    {
        switch (format)
        {
            case MatchFormatEnum.TiebreakToTen:
                return TiebreakToTen.Create();
            case MatchFormatEnum.BestOfThreeSevenPointTiebreaker:
                return BestOfFiveSevenPointTiebreaker.Create();
            case MatchFormatEnum.BestOfFiveSevenPointTiebreaker:
                return BestOfFiveSevenPointTiebreaker.Create();
            case MatchFormatEnum.FastFour:
                return FastFour.Create();
            default:
                throw new ApplicationException($"missing case statement for {format}");
        }
    }
}