using MediatR;

namespace Matches.Application.Abstractions.Messaging;

/// <summary>
/// IQueryHandler interface for CQRS separation with MediatR IRequestHandler
/// </summary>
public interface IQueryHandler<TQuery, TResponse>
    : IRequestHandler<TQuery, TResponse>
    where TQuery: IQuery<TResponse>
{   
}