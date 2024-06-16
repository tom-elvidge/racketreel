using MediatR;

namespace RacketReel.Application.Common;

public interface ICommand : IRequest<Result>
{   
}
public interface ICommand<TResponse> : IRequest<Result<TResponse>>
{
}