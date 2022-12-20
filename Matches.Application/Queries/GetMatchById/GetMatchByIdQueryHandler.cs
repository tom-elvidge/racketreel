using Matches.Application.Abstractions.Messaging;
using Matches.Application.DTOs;
using Matches.Application.Errors;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.AggregatesModel.MatchAggregate.Formats;
using Matches.Domain.SeedWork;
using MediatR;
using Microsoft.Extensions.Logging;

namespace Matches.Application.Queries.GetMatchById;

public sealed class GetMatchByIdQueryHandler : IQueryHandler<GetMatchByIdQuery, MatchDTO>
{
    private readonly IMediator _mediator;
    private readonly ILogger<GetMatchByIdQueryHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    public GetMatchByIdQueryHandler(
        IMediator mediator,
        ILogger<GetMatchByIdQueryHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<MatchDTO>> Handle(GetMatchByIdQuery query, CancellationToken cancellationToken)
    {
        var match = await _matchRepository.GetAsync(query.MatchId, true);
        
        if (match == null)
        {
            return Result.Failure<MatchDTO>(ApplicationErrors.NotFound);
        }

        return Result.Success<MatchDTO>(MatchDTO.Create(match));
    }
}