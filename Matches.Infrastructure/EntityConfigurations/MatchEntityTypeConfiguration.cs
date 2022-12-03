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

        matchConfiguration
            .OwnsOne(m => m.Summary, summary =>
            {
                // Explicit configuration of the shadow key property in the owned type 
                // as a workaround for a documented issue in EF Core 5: https://github.com/dotnet/efcore/issues/20740
                summary.Property<int>("MatchId")
                .UseHiLo("matchseq", MatchesContext.DEFAULT_SCHEMA);
                summary.WithOwner();

                summary
                    .Property<DateTime>("CompletedDateTime")
                    .HasColumnName("CompletedDateTime")
                    .IsRequired();
                summary
                    .Property<Participant>("Winner")
                    .HasColumnName("Winner")
                    .IsRequired();

                summary.OwnsMany(summary => summary.Sets, setSummary =>
                {
                    setSummary
                        .Property<int>("MatchId")
                        .UseHiLo("matchseq", MatchesContext.DEFAULT_SCHEMA);
                    setSummary
                        .WithOwner();
                    setSummary
                        .Property<DateTime>("CompletedDateTime")
                        .HasColumnName("CompletedDateTime")
                        .IsRequired();
                    setSummary
                        .Property<Participant>("Winner")
                        .HasColumnName("Winner")
                        .IsRequired();
                    setSummary
                        .Property<int>("ParticipantOneGames")
                        .HasColumnName("ParticipantOneGames")
                        .IsRequired();
                    setSummary
                        .Property<int>("ParticipantTwoGames")
                        .HasColumnName("ParticipantTwoGames")
                        .IsRequired();
                    setSummary
                        .Property<bool>("TieBreak")
                        .HasColumnName("TieBreak")
                        .IsRequired();
                    setSummary
                        .Property<int?>("ParticipantOneTieBreakPoints")
                        .HasColumnName("ParticipantOneTieBreakPoints");
                    setSummary
                        .Property<int?>("ParticipantTwoTieBreakPoints")
                        .HasColumnName("ParticipantTwoTieBreakPoints");
                });
            });

        var navigation = matchConfiguration.Metadata.FindNavigation(nameof(Match.States));
        // Set as field to access the States collection property through its field
        navigation.SetPropertyAccessMode(PropertyAccessMode.Field);
    }
}
