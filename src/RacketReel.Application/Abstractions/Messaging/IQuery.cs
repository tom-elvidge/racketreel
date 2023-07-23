using RacketReel.Domain.SeedWork;
using MediatR;

namespace RacketReel.Application.Abstractions.Messaging;

/// <summary>
/// IQuery interface for CQRS separation with MediatR IRequest
/// </summary>
public interface IQuery<TResponse> : IRequest<Result<TResponse>>
{
}