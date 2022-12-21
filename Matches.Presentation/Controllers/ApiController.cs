using System.Diagnostics;
using Matches.Application.Errors;
using Matches.Domain.SeedWork;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Matches.Presentation.Controllers;

public abstract class ApiController : ControllerBase
{
    protected readonly ISender Sender;

    protected ApiController(ISender sender)
    {
        Sender = sender;
    }

    protected IActionResult HandleFailure(Result result)
    {
        if (result.IsSuccess)
            throw new InvalidOperationException();

        if (result is IValidationResult)
        {
            var validationResult = (IValidationResult) result;
            return BadRequest(
                CreateProblemDetails(
                    StatusCodes.Status400BadRequest,
                    result.Error,
                    validationResult.Errors));
        }

        if (result.Error == ApplicationErrors.NotFound)
            return NotFound(
                CreateProblemDetails(
                    StatusCodes.Status404NotFound,
                    result.Error
                )
            );

        return Problem();
    }

    protected static ProblemDetails CreateProblemDetails(
        int status,
        Error error,
        Error[]? errors = null)
    {
        return new ProblemDetails
        {
            Title = error.Code,
            Detail = error.Message,
            Status = status,
            Extensions = { { nameof(errors), errors } }
        };
    }
}