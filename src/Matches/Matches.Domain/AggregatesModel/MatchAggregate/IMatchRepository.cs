using Matches.Domain.SeedWork;

namespace Matches.Domain.AggregatesModel.MatchAggregate;

public interface IMatchRepository : IRepository<MatchEntity>
{
    MatchEntity Add(MatchEntity match);

    void Update(MatchEntity match);

    Task<MatchEntity> GetAsync(int matchId, bool includeStates);

    bool Delete(int matchId);

    /// <summary>
    /// Get a page of matches.
    /// </summary>
    /// <param name="pageSize">The maximum number of matches to include on a page.</param>
    /// <param name="pageNumber">The page of matches to get.</param>
    /// <param name="orderBy">How to order the collection of matches.</param>
    /// <param name="includeStates">Get all the states for each match.</param>
    /// <param name="matchCompleteQueryStatus">Get only complete, incomplete, or both.</param>
    /// <param name="userIds">What users to get matches for. All users if null.</param>
    /// <returns>A tuple where the first element is the ordered collection of matches on the requested page, and the second element is the total number of pages.</returns>
    Task<Tuple<IEnumerable<MatchEntity>, int>> GetAsync(int pageNumber, int pageSize, MatchesOrderByEnum orderBy, bool includeStates, MatchCompleteQueryStatus matchCompleteQueryStatus, string[] userIds = null);
}