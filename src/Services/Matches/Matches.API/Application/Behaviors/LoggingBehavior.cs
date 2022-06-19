using System.Threading;
using System.Threading.Tasks;
using MediatR.Pipeline;
using Microsoft.Extensions.Logging;

namespace RacketReel.Services.Matches.API.Application.Behaviors;

public class LoggingBehavior<TRequest> : IRequestPreProcessor<TRequest>
{
    private readonly ILogger<TRequest> _logger;

    public LoggingBehavior(ILogger<TRequest> logger)
    {
        _logger = logger;
    }

    public async Task Process(TRequest request, CancellationToken cancellationToken)
    {
        _logger.LogInformation(" Request: {Name} {@Request}",
            typeof(TRequest).Name, request);
    }
}