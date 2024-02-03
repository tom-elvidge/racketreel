using Matches.Application.Models;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.Errors;
using Matches.Application.Models.Match;
using Matches.Application.Services;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.SeedWork;

namespace Matches.Application.Queries.GetAllStates;

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