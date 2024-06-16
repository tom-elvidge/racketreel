using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RacketReel.Domain.Users;

namespace RacketReel.Infrastructure.Users;

public class UserInfoEntityConfiguration : IEntityTypeConfiguration<UserInfoEntity>
{
    public void Configure(EntityTypeBuilder<UserInfoEntity> builder)
    {
        builder.ToTable("UserInfo", Constants.SchemaName);

        builder.HasKey(uie => uie.Id);

        builder.Property(uie => uie.Id).HasConversion(id => id.Value, value => new UserId(value));
    }
}