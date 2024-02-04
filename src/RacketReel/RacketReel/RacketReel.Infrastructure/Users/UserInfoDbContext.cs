using Microsoft.EntityFrameworkCore;
using RacketReel.Domain.Users;

namespace RacketReel.Infrastructure.Users;

public class UserInfoDbContext(DbContextOptions<UserInfoDbContext> options) : DbContext(options)
{
    public DbSet<UserInfoEntity> UserInfoEntities { get; private set; } = null!;

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfiguration(new UserInfoEntityConfiguration());
    }
}