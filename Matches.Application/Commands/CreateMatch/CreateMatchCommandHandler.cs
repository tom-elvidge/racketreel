using Matches.Application.DTOs;
using Matches.Application.Abstractions.Messaging;
using MediatR;
using Microsoft.Extensions.Logging;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.AggregatesModel.MatchAggregate.Formats;
using Matches.Domain.AggregatesModel.MatchAggregate.Participants;
using Matches.Domain.SeedWork;

namespace Matches.Application.Commands.CreateMatch;

public class CreateMatchCommandHandler : ICommandHandler<CreateMatchCommand, Match>
{
    private readonly IMediator _mediator;
    private readonly ILogger<CreateMatchCommandHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    public CreateMatchCommandHandler(
        IMediator mediator,
        ILogger<CreateMatchCommandHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<Match>> Handle(CreateMatchCommand command, CancellationToken cancellationToken)
    {
        var playerOne = command.Participants[0];
        var playerTwo = command.Participants[1];
        var servingFirst = command.ServingFirst == playerOne ? ParticipantEnum.One : ParticipantEnum.Two;

        var match = MatchEntity.Create(
            new NoUserParticipant(playerOne),
            new NoUserParticipant(playerTwo),
            servingFirst,
            CreateFormat(command.Format));

        _matchRepository.Add(match);
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

        return Result.Success<Match>(Match.Create(match));
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