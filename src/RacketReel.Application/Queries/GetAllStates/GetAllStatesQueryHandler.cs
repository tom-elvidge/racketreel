using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Errors;
using RacketReel.Application.Models;
using RacketReel.Application.Services;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.SeedWork;

namespace RacketReel.Application.Queries.GetAllStates;

public class GetAllStatesQueryHandler : IQueryHandler<GetAllStatesQuery, List<State>>
{
    private readonly IMatchRepository _matchRepository;

    public GetAllStatesQueryHandler(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }
    
    public async Task<Result<List<State>>> Handle(GetAllStatesQuery query, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(query.MatchId, true);
        
        if (matchEntity == null)
        {
            return Result.Failure<List<State>>(ApplicationErrors.NotFound);
        }

        return Result.Success(matchEntity.States
            .Select(stateEntity => StateCreator.CreateState(matchEntity, stateEntity))
            .ToList());
    }
}