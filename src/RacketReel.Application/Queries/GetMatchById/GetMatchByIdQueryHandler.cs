using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.SeedWork;
using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Errors;
using RacketReel.Application.Models;
using RacketReel.Application.Services;

namespace RacketReel.Application.Queries.GetMatchById;

public sealed class GetMatchByIdQueryHandler : IQueryHandler<GetMatchByIdQuery, Match>
{
    private readonly IMatchRepository _matchRepository;

    public GetMatchByIdQueryHandler(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<Match>> Handle(GetMatchByIdQuery query, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(query.MatchId, true);
        
        if (matchEntity == null)
            return Result.Failure<Match>(ApplicationErrors.NotFound);
        
        if (!matchEntity.IsComplete())
            return Result.Failure<Match>(ApplicationErrors.NotComplete);
 
        return Result.Success(MatchCreator.CreateMatch(matchEntity));
    }
}