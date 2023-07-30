using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.SeedWork;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Errors;
using RacketReel.Application.Models;
using RacketReel.Application.Services;

namespace RacketReel.Application.Queries.GetStateByIndex;

public class GetStateByIndexQueryHandler : IQueryHandler<GetStateByIndexQuery, State>
{
    private readonly IMatchRepository _matchRepository;

    public GetStateByIndexQueryHandler(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<State>> Handle(GetStateByIndexQuery query, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(query.MatchId, true);
        
        if (matchEntity == null)
        {
            return Result.Failure<State>(ApplicationErrors.NotFound);
        }
        
        try
        {
            var stateEntity = matchEntity.States
                .OrderBy(s => s.CreatedAtDateTime)
                .ToList()[query.StateIndex];
            return Result.Success(StateCreator.CreateState(matchEntity, stateEntity));
        }
        catch (ArgumentOutOfRangeException)
        {
            return Result.Failure<State>(ApplicationErrors.NotFound);
        }
    }
}