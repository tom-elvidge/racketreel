using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Services.Matches.Domain.SeedWork;

namespace RacketReel.Services.Matches.Infrastructure.Repositories;

public class MatchRepository : IMatchRepository
{
    private readonly MatchesContext _context;

    public IUnitOfWork UnitOfWork => _context;

    public MatchRepository(MatchesContext context)
    {
        _context = context ?? throw new ArgumentNullException(nameof(context));
    }

    public async Task<IEnumerable<Match>> GetAsync(int pageNumber, int pageSize, bool? complete, bool includeStates)
    {
        var matches = await _context
            .Matches
            .Where(match => complete == null ? true : match.Complete == complete)
            .Skip((pageNumber - 1) * pageSize)
            .Take(pageSize)
            .Include(x => x.Format)
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

        return matches;
    }

    public Match Add(Match match)
    {
        return _context.Matches.Add(match).Entity;

    }

    public async Task<Match> GetAsync(int matchId, bool includeStates)
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

    public void Update(Match match)
    {
        _context.Entry(match).State = EntityState.Modified;
    }
}