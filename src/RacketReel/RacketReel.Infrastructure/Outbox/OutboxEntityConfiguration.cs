using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace RacketReel.Infrastructure.Outbox;

public class OutboxEntityConfiguration : IEntityTypeConfiguration<OutboxEntity>
{
    public void Configure(EntityTypeBuilder<OutboxEntity> builder)
    {
        builder.ToTable("Outbox", Constants.SchemaName);
    }
}