using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.Infrastructure.EntityConfigurations;

class SetTypeEntityTypeConfiguration : IEntityTypeConfiguration<SetType>
{
    public void Configure(EntityTypeBuilder<SetType> setTypeConfiguration)
    {
        setTypeConfiguration.ToTable("settypes", MatchesContext.DEFAULT_SCHEMA);

        setTypeConfiguration.HasKey(s => s.Id);

        setTypeConfiguration.Property(s => s.Id)
            .HasDefaultValue(1)
            .ValueGeneratedNever()
            .IsRequired();

        setTypeConfiguration.Property(s => s.Name)
            .HasMaxLength(200)
            .IsRequired();
    }
}
