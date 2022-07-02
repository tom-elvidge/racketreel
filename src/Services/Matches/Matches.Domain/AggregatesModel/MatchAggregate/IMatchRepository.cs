using System.Collections.Generic;
using System.Threading.Tasks;
using RacketReel.Services.Matches.Domain.SeedWork;

namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public interface IMatchRepository : IRepository<Match>
{
    Match Add(Match match);

    void Update(Match match);

    Task<Match> GetAsync(int matchId);

    Task<IEnumerable<Match>> GetAsync();
}
