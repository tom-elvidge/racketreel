using Matches.Application.Abstractions.Messaging;
using Matches.Application.Errors;
using Matches.Application.Models;
using Matches.Application.Models.Match;
using Matches.Application.Services;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.SeedWork;

namespace Matches.Application.Queries.GetInProgressMatches;

public class GetInProgressMatchesQueryHandler : IQueryHandler<GetInProgressMatchesQuery, Paginated<(Metadata, State)>>
{
    private readonly IMatchRepository _matchRepository;

    public GetInProgressMatchesQueryHandler(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<Paginated<(Metadata, State)>>> Handle(GetInProgressMatchesQuery query, CancellationToken cancellationToken)
    {
        Tuple<IEnumerable<MatchEntity>, int> result;
        try
        { 
            result = await _matchRepository.GetAsync(
                query.PageNumber,
                query.PageSize,
                MatchesOrderByEnum.CreatedAt,
                true,
                query.UserIds);
        }
        catch (ArgumentException)
        {
            return Result.Failure<Paginated<(Metadata, State)>>(ApplicationErrors.NotFound);
        }

        var matchEntities = result.Item1;
        var totalPages = result.Item2;

        return Result.Success(new Paginated<(Metadata, State)>
        {
            PageSize = query.PageSize,
            PageNumber = query.PageNumber,
            PageCount = totalPages,
            Page = matchEntities.Select(matchEntity => (
                new Metadata
                {
                    CreatedAt = matchEntity.CreatedAtDateTime,
                    Format = MatchCreator.GetFormatAsEnum(matchEntity.Format),
                    Id = matchEntity.Id,
                    TeamOneName = matchEntity.ParticipantOne.Name,
                    TeamTwoName = matchEntity.ParticipantTwo.Name,
                    CreateByUserId = matchEntity.UserId
                }, 
                StateCreator.CreateState(matchEntity, matchEntity.States.Last())
            )).ToList()
        });
    }
}