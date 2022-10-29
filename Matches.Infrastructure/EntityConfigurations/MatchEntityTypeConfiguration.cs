using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Services.Matches.Infrastructure.EntityConfigurations;

class MatchEntityTypeConfiguration : IEntityTypeConfiguration<Match>
{
    public void Configure(EntityTypeBuilder<Match> matchConfiguration)
    {
        matchConfiguration.ToTable("matches", MatchesContext.DEFAULT_SCHEMA);

        matchConfiguration.HasKey(m => m.Id);

        matchConfiguration.Ignore(m => m.DomainEvents);

        matchConfiguration.Property(m => m.Id)
            .UseHiLo("matchseq", MatchesContext.DEFAULT_SCHEMA);

        // Format value object persisted as owned entity
        matchConfiguration
            .OwnsOne(m => m.Format, f =>
            {
                // Explicit configuration of the shadow key property in the owned type 
                // as a workaround for a documented issue in EF Core 5: https://github.com/dotnet/efcore/issues/20740
                f.Property<int>("MatchId")
                    .UseHiLo("matchseq", MatchesContext.DEFAULT_SCHEMA);
                f.WithOwner();

                f.Property<int>("Sets")
                    .HasColumnName("Sets")
                    .IsRequired();

                f.Property<SetType>("NormalSetType")
                    .HasColumnName("NormalSetType")
                    .IsRequired();

                f.Property<SetType>("FinalSetType")
                    .HasColumnName("FinalSetType")
                    .IsRequired();
            });

        matchConfiguration
            .Property<DateTime>("CreatedDateTime")
            .HasColumnName("CreatedDateTime")
            .IsRequired();

        matchConfiguration
            .Property<string>("ParticipantOne")
            .HasColumnName("ParticipantOne")
            .IsRequired();
        
        matchConfiguration
            .Property<string>("ParticipantTwo")
            .HasColumnName("ParticipantTwo")
            .IsRequired();

        matchConfiguration
            .Property<bool>("Complete")
            .HasColumnName("Complete")
            .IsRequired();

        var navigation = matchConfiguration.Metadata.FindNavigation(nameof(Match.States));
        // Set as field to access the States collection property through its field
        navigation.SetPropertyAccessMode(PropertyAccessMode.Field);
    }
}
