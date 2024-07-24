using Microsoft.EntityFrameworkCore;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.SeedWork;

namespace Matches.Infrastructure.Repositories;

public class MatchRepository : IMatchRepository
{
    private readonly MatchesContext _context;

    public IUnitOfWork UnitOfWork => _context;

    public MatchRepository(MatchesContext context)
    {
        _context = context ?? throw new ArgumentNullException(nameof(context));
    }

    public bool Delete(int matchId)
    {
        var matchEntity = _context.Matches.FirstOrDefault(m => m.Id.Equals(matchId));

        if (matchEntity == null) return false;

        _context.Matches.Remove(matchEntity);

        return true;
    }

    public async Task<Tuple<IEnumerable<MatchEntity>, int>> GetAsync(int pageNumber, int pageSize, MatchesOrderByEnum orderBy, bool includeStates, string[] userIds = null)
    {
        var matchesQuery = _context
            .Matches
            // only get completed matches if ordering by completed at date time
            .Where(m => orderBy == MatchesOrderByEnum.CompletedAt ? m.CompletedAtDateTime != DateTime.MaxValue : true)
            .Where(m => userIds == null || userIds.Contains(m.UserId));

        var matchesCount = await matchesQuery.CountAsync();
        int totalPages = (int) Math.Floor((double) matchesCount / pageSize);
        // Add an extra page if there are any left over matches
        if (matchesCount % pageSize != 0)
            totalPages++;

        if (pageNumber > totalPages)
        {
            throw new ArgumentException("requesting a page that is greater than the total number of pages");
        }

        var matches = await matchesQuery
            .OrderBy(m => orderBy == MatchesOrderByEnum.CompletedAt ? m.CompletedAtDateTime : m.CreatedAtDateTime)
            .Skip((pageNumber - 1) * pageSize)
            .Take(pageSize)
            .Include(m => m.Format)
            .ToListAsync();

        // Get the states for each match
        if (includeStates) {
            foreach (var match in matches)
            {
                await _context.Entry(match)
                    .Collection(m => m.States)
                    .LoadAsync();
            }
        }

        return new Tuple<IEnumerable<MatchEntity>, int>(matches, totalPages);
    }

    public MatchEntity Add(MatchEntity match)
    {
        return _context.Matches.Add(match).Entity;

    }

    public async Task<MatchEntity> GetAsync(int matchId, bool includeStates)
    {
        // todo: bug here it is getting a match state which zero score and date time now
        var match = await _context
                            .Matches
                            .Include(x => x.Format)
                            .FirstOrDefaultAsync(m => m.Id == matchId);
        if (match == null)
        {
            match = _context
                        .Matches
                        .Local
                        .FirstOrDefault(m => m.Id == matchId);
        }
        if (match != null && includeStates)
        {
            await _context.Entry(match)
                .Collection(m => m.States).LoadAsync();
        }

        return match;
    }

    public void Update(MatchEntity match)
    {
        _context.Entry(match).State = EntityState.Modified;
    }
}