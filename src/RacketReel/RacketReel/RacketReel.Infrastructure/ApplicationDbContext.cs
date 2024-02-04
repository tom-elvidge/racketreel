using Microsoft.EntityFrameworkCore;
using RacketReel.Domain.Users;
using RacketReel.Infrastructure.Outbox;
using RacketReel.Infrastructure.Users;

namespace RacketReel.Infrastructure;

public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : DbContext(options)
{
    public DbSet<UserInfoEntity> UserInfoEntities { get; private set; } = null!;

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfiguration(new UserInfoEntityConfiguration());
        modelBuilder.ApplyConfiguration(new OutboxEntityConfiguration());
    }
}