using Matches.Application.Models;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.Errors;
using Matches.Application.Models.Match;
using Matches.Application.Services;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.SeedWork;

namespace Matches.Application.Queries.GetMatchMetadata;

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