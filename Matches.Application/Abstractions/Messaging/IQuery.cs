using Matches.Domain.SeedWork;
using MediatR;

namespace Matches.Application.Abstractions.Messaging;

/// <summary>
/// IQuery interface for CQRS separation with MediatR IRequest
/// </summary>
public interface IQuery<TResponse> : IRequest<Result<TResponse>>
{
}