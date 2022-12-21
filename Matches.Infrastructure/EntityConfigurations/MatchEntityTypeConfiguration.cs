using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.AggregatesModel.MatchAggregate.Participants;
using Matches.Domain.AggregatesModel.MatchAggregate.Formats;

namespace Matches.Infrastructure.EntityConfigurations;

class MatchEntityTypeConfiguration : IEntityTypeConfiguration<MatchEntity>
{
    public void Configure(EntityTypeBuilder<MatchEntity> match)
    {
        match.ToTable("matches", MatchesContext.DEFAULT_SCHEMA);

        match.HasKey(m => m.Id);

        match.Ignore(m => m.DomainEvents);

        match.Property(m => m.Id)
            .UseHiLo("matchseq", MatchesContext.DEFAULT_SCHEMA);

        match
            .Property<DateTime>("CreatedAtDateTime")
            .HasColumnName("CreatedAtDateTime")
            .IsRequired();

        match
            .Property<DateTime>("CompletedAtDateTime")
            .HasColumnName("CompletedAtDateTime")
            .IsRequired();

        match
            .OwnsOne(m => m.ParticipantOne, p =>
            {
                // Explicit configuration of the shadow key property in the owned type 
                // as a workaround for a documented issue in EF Core 5: https://github.com/dotnet/efcore/issues/20740
                p.Property<int>("MatchId")
                .UseHiLo("matcheseq", MatchesContext.DEFAULT_SCHEMA);
                p.WithOwner();
            });

         match
            .OwnsOne(m => m.ParticipantTwo, p =>
            {
                // Explicit configuration of the shadow key property in the owned type 
                // as a workaround for a documented issue in EF Core 5: https://github.com/dotnet/efcore/issues/20740
                p.Property<int>("MatchId")
                .UseHiLo("matcheseq", MatchesContext.DEFAULT_SCHEMA);
                p.WithOwner();
            });

        match
            .Property<ParticipantEnum>("ServingFirst")
            .HasColumnName("ServingFirst")
            .IsRequired();

        // Format value object persisted as owned entity
        match
            .OwnsOne(m => m.Format, f =>
            {
                // Explicit configuration of the shadow key property in the owned type 
                // as a workaround for a documented issue in EF Core 5: https://github.com/dotnet/efcore/issues/20740
                f.Property<int>("MatchId")
                    .UseHiLo("matchseq", MatchesContext.DEFAULT_SCHEMA);
                f.WithOwner();

                f.Property<SetsEnum>("Sets")
                    .HasColumnName("Sets")
                    .IsRequired();

                f.Property<bool>("SuddenDeathDeuce")
                    .HasColumnName("SuddenDeathDeuce")
                    .IsRequired();

                f.Property<GamesEnum>("Games")
                    .HasColumnName("Games")
                    .IsRequired();

                f.Property<GamesEnum?>("_gamesFinalSet")
                    .HasColumnName("_gamesFinalSet");

                f.Property<bool>("GameAdvantage")
                    .HasColumnName("GameAdvantage")
                    .IsRequired();

                f.Property<bool?>("_gameAdvantageFinalSet")
                    .HasColumnName("_gameAdvantageFinalSet");

                f.Property<TiebreakRuleEnum>("TiebreakRule")
                    .HasColumnName("TiebreakRule")
                    .IsRequired();
                
                f.Property<TiebreakRuleEnum?>("_tiebreakRuleFinalSet")
                    .HasColumnName("_tiebreakRuleFinalSet");
            });


        var navigation = match.Metadata.FindNavigation(nameof(MatchEntity.States));
        // Set as field to access the States collection property through its field
        navigation.SetPropertyAccessMode(PropertyAccessMode.Field);
    }
}