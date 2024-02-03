using Matches.Domain.SeedWork;
using MediatR;

namespace Matches.Application.Abstractions.Messaging;

/// <summary>
/// ICommand interface for CQRS separation with MediatR IRequest
/// </summary>
public interface ICommand : IRequest<Result>
{   
}

/// <summary>
/// ICommand interface for CQRS separation with MediatR IRequest
/// </summary>
public interface ICommand<TResponse> : IRequest<Result<TResponse>>
{
}