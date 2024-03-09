using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RacketReel.Domain.Followers;
using RacketReel.Domain.Users;

namespace RacketReel.Infrastructure.Users;

public class FollowerEntityConfiguration : IEntityTypeConfiguration<FollowerEntity>
{
    public void Configure(EntityTypeBuilder<FollowerEntity> builder)
    {
        builder.ToTable("Follower", Constants.SchemaName);

        builder.HasKey(fe => new { fe.UserId, fe.FollowerUserId });

        builder.Property(fe => fe.UserId).HasConversion(id => id.Value, value => new UserId(value));
        
        builder.Property(fe => fe.FollowerUserId).HasConversion(id => id.Value, value => new UserId(value));
    }
}