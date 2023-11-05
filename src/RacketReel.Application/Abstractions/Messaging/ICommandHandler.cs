using RacketReel.Domain.SeedWork;
using MediatR;

namespace RacketReel.Application.Abstractions.Messaging;

/// <summary>
/// ICommandHandler interface for CQRS separation with MediatR IRequestHandler with response
/// </summary>
public interface ICommandHandler<TCommand, TResponse>
    : IRequestHandler<TCommand, Result<TResponse>>
    where TCommand: ICommand<TResponse>
{   
}

/// <summary>
/// ICommandHandler interface for CQRS separation with MediatR IRequestHandler
/// </summary>
public interface ICommandHandler<TCommand>
    : IRequestHandler<TCommand, Result> 
    where TCommand : ICommand
{
}