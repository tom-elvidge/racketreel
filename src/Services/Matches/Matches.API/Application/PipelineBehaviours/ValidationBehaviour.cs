using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using FluentValidation;
using MediatR;
using Microsoft.Extensions.Logging;
using RacketReel.Services.Matches.Domain.Exceptions;

namespace RacketReel.Services.Matches.API.Application.PipelineBehaviours;

// https://codewithmukesh.com/blog/mediatr-pipeline-behaviour/
// https://github.com/jasontaylordev/CleanArchitecture/blob/main/src/Application/Common/Behaviours/ValidationBehaviour.cs
public class ValidationBehaviour<TRequest, TResponse> : IPipelineBehavior<TRequest, TResponse> where TRequest : IRequest<TResponse>
{
    private readonly IEnumerable<IValidator<TRequest>> _validators;
    private readonly ILogger<ValidationBehaviour<TRequest, TResponse>> _logger;

    public ValidationBehaviour(IEnumerable<IValidator<TRequest>> validators, ILogger<ValidationBehaviour<TRequest, TResponse>> logger)
    {
        _validators = validators;
        _logger = logger;
    }

    public async Task<TResponse> Handle(TRequest request, CancellationToken cancellationToken, RequestHandlerDelegate<TResponse> next)
    {
        if (_validators.Any())
        {
            var context = new ValidationContext<TRequest>(request);

            var validationResults = await Task.WhenAll(
                _validators.Select(v =>
                v.ValidateAsync(context, cancellationToken)));

            var failures = validationResults
                .Where(r => r.Errors.Any())
                .SelectMany(r => r.Errors)
                .ToList();

            if (failures.Any())
            {
                _logger.LogWarning("Validation errors - Command: {@Command} - Errors: {@ValidationErrors}", request, failures);

                // Todo: Respond with 400 Bad Request and error messages if any validations fail
                throw new MatchesDomainException(
                    $"Command Validation Errors for type {typeof(TRequest).Name}",
                    new ValidationException("Validation exception", failures)
                );
            }
        }

        return await next();
    }
}
