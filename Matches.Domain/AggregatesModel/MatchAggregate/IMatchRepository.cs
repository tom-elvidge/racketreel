using Matches.Domain.SeedWork;

namespace Matches.Domain.AggregatesModel.MatchAggregate;

public interface IMatchRepository : IRepository<Match>
{
    Match Add(Match match);

    void Update(Match match);

    Task<Match> GetAsync(int matchId, bool includeStates);

    Task<IEnumerable<Match>> GetAsync(int pageNumber, int pageSize, bool includeStates);

    Task<int> GetPageCountAsync(int pageSize);
}