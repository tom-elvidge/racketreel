using RacketReel.Domain.SeedWork;
using MediatR;

namespace RacketReel.Application.Abstractions.Messaging;

/// <summary>
/// IQueryHandler interface for CQRS separation with MediatR IRequestHandler
/// </summary>
public interface IQueryHandler<TQuery, TResponse>
    : IRequestHandler<TQuery, Result<TResponse>>
    where TQuery: IQuery<TResponse>
{   
}