using System;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.API.Application.Commands;

public class CreateMatchCommandHandler : IRequestHandler<CreateMatchCommand, bool>
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

    public async Task<bool> Handle(CreateMatchCommand request, CancellationToken cancellationToken)
    {
        // Todo: Validate request

        // Todo: Use actual data from request
        var format = new Format(3, SetType.SixAllAdvantageRule, SetType.SixAllAdvantageRule);
        var match = new Match("one", "two", format, 0);

        _logger.LogInformation("Creating Match: {@Match}", match);

        _matchRepository.Add(match);

        return await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
    }
}
