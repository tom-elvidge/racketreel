using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace Matches.Infrastructure.EntityConfigurations;

class StateEntityTypeConfiguration : IEntityTypeConfiguration<State>
{
    public void Configure(EntityTypeBuilder<State> stateConfiguration)
    {
        stateConfiguration.ToTable("states", MatchesContext.DEFAULT_SCHEMA);

        stateConfiguration.HasKey(s => s.Id);

        stateConfiguration.Ignore(s => s.DomainEvents);

        stateConfiguration.Property(s => s.Id)
            .UseHiLo("stateseq", MatchesContext.DEFAULT_SCHEMA);

        stateConfiguration
            .OwnsOne(st => st.Score, sc =>
            {
                // Explicit configuration of the shadow key property in the owned type 
                // as a workaround for a documented issue in EF Core 5: https://github.com/dotnet/efcore/issues/20740
                sc.Property<int>("StateId")
                .UseHiLo("stateseq", MatchesContext.DEFAULT_SCHEMA);
                sc.WithOwner();
            });

        stateConfiguration
            .Property<int>("MatchId")
            .IsRequired();

        stateConfiguration
            .Property<DateTime>("CreatedDateTime")
            .HasColumnName("CreatedDateTime")
            .IsRequired();

        stateConfiguration
            .Property<Participant>("Serving")
            .HasColumnName("Serving")
            .IsRequired();
    }
}