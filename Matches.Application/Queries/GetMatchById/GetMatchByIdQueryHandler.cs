using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;
using Matches.Application.Errors;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.AggregatesModel.MatchAggregate.Formats;
using Matches.Domain.SeedWork;
using MediatR;
using Microsoft.Extensions.Logging;

namespace Matches.Application.Queries.GetMatchById;

/// <summary>
/// Handler for GetMatchByIdQuery
/// </summary>
public sealed class GetMatchByIdQueryHandler : IQueryHandler<GetMatchByIdQuery, MatchDTO>
{
    private readonly IMediator _mediator;
    private readonly ILogger<GetMatchByIdQueryHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    /// <summary>
    /// Constructor for CreateMatchCommandHandler
    /// </summary>
    public GetMatchByIdQueryHandler(
        IMediator mediator,
        ILogger<GetMatchByIdQueryHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    /// <summary>
    /// Handle GetMatchByIdQuery queries
    /// </summary>
    public async Task<Result<MatchDTO>> Handle(GetMatchByIdQuery query, CancellationToken cancellationToken)
    {
        var match = await _matchRepository.GetAsync(query.MatchId, true);
        
        if (match == null)
        {
            return Result.Failure<MatchDTO>(ApplicationErrors.NotFound);
        }

        var dto = new MatchDTO
        {
            Id = match.Id,
            CreatedAt = match.CreatedAtDateTime.ToString(),
            Players = new List<string>() {
                match.ParticipantOne.Name,
                match.ParticipantTwo.Name
            },
            ServingFirst = match.ServingFirst == ParticipantEnum.One
                ? match.ParticipantOne.Name
                : match.ParticipantTwo.Name,
            Format = GetMatchFormatEnum(match.Format)
        };

        return Result.Success<MatchDTO>(dto);
    }

    private MatchFormatEnum GetMatchFormatEnum(Format format)
    {
        if (format.Equals(TiebreakToTen.Create()))
        {
            return MatchFormatEnum.TiebreakToTen;
        }
        if (format.Equals(BestOfThreeSevenPointTiebreaker.Create()))
        {
            return MatchFormatEnum.BestOfThreeSevenPointTiebreaker;
        }
        if (format.Equals(BestOfFiveSevenPointTiebreaker.Create()))
        {
            return MatchFormatEnum.BestOfFiveSevenPointTiebreaker;
        }
        if (format.Equals(FastFour.Create()))
        {
            return MatchFormatEnum.FastFour;
        }
        throw new ApplicationException($"format {format} is not recognized as one of the presets");
    }
}