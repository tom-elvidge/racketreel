using MediatR;

namespace RacketReel.Application.Common;

public interface IQueryHandler<TQuery, TResponse>
    : IRequestHandler<TQuery, Result<TResponse>>
    where TQuery: IQuery<TResponse>
{   
}