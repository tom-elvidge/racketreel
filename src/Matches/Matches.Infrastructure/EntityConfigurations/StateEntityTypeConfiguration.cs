using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Matches.Domain.AggregatesModel.MatchAggregate;

namespace Matches.Infrastructure.EntityConfigurations;

class StateEntityTypeConfiguration : IEntityTypeConfiguration<StateEntity>
{
    public void Configure(EntityTypeBuilder<StateEntity> stateConfiguration)
    {
        stateConfiguration.ToTable("States", MatchesContext.DEFAULT_SCHEMA);

        stateConfiguration.HasKey(s => s.Id);

        stateConfiguration.Ignore(s => s.DomainEvents);

        stateConfiguration.Property(s => s.Id)
            .UseHiLo("Stateseq", MatchesContext.DEFAULT_SCHEMA);

        stateConfiguration
            .OwnsOne(st => st.Score, sc =>
            {
                // Explicit configuration of the shadow key property in the owned type 
                // as a workaround for a documented issue in EF Core 5: https://github.com/dotnet/efcore/issues/20740
                sc.Property<int>("StateEntityId")
                .UseHiLo("Stateseq", MatchesContext.DEFAULT_SCHEMA);
                sc.WithOwner();
            });

        stateConfiguration
            .Property<int>("MatchEntityId")
            .IsRequired();

        stateConfiguration
            .Property<DateTime>("CreatedAtDateTime")
            .HasColumnName("CreatedAtDateTime")
            .IsRequired();

        stateConfiguration
            .Property<ParticipantEnum>("Serving")
            .HasColumnName("Serving")
            .IsRequired();

        stateConfiguration
            .Property<bool>("Highlight")
            .HasColumnName("Highlight")
            .IsRequired();
    }
}