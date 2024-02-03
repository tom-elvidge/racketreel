using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Errors;
using RacketReel.Application.Models;
using RacketReel.Application.Models.Match;
using RacketReel.Application.Services;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.SeedWork;

namespace RacketReel.Application.Queries.GetMatchMetadata;

public class GetMatchMetadataQueryHandler : IQueryHandler<GetMatchMetadataQuery, Metadata>
{
    private readonly IMatchRepository _matchRepository;

    public GetMatchMetadataQueryHandler(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<Metadata>> Handle(GetMatchMetadataQuery request, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(request.MatchId, false);
        
        if (matchEntity == null)
        {
            return Result.Failure<Metadata>(ApplicationErrors.NotFound);
        }

        return Result.Success(new Metadata
        {
            CreatedAt = matchEntity.CreatedAtDateTime,
            Format = MatchCreator.GetFormatAsEnum(matchEntity.Format),
            Id = matchEntity.Id,
            TeamOneName = matchEntity.ParticipantOne.Name,
            TeamTwoName = matchEntity.ParticipantTwo.Name
        });
    }
}