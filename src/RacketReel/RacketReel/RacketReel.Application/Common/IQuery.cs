using MediatR;

namespace RacketReel.Application.Common;

public interface IQuery<TResponse> : IRequest<Result<TResponse>>
{
}