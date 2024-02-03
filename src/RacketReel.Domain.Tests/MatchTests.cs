using Xunit;
using FluentAssertions;
using RacketReel.Domain;
using RacketReel.Domain.AggregatesModel.MatchAggregate.Formats;
using System.Collections.Generic;
using System;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.AggregatesModel.MatchAggregate.Participants;
using System.Linq;

namespace RacketReel.Domain.Tests;

public class MatchTests
{
    public static IEnumerable<object[]> TestUpdateServingData()
    {
        yield return new object[]
        {
            new MatchEntity(
                "12345",
                DateTime.MinValue,
                DateTime.MaxValue,
                new NoUserParticipant("Tom Elvidge"),
                new NoUserParticipant("Joe Bloggs"),
                ParticipantEnum.One,
                BestOfThree.Create(),
                new List<StateEntity>() {
                    new StateEntity(
                        DateTime.MinValue,
                        ParticipantEnum.One,
                        new Score(3, 0, 0, 0, 0, 0),
                        false,
                        7)
                }),
            ParticipantEnum.One,
            ParticipantEnum.Two,
            "it is game point to participant one in their service game and they win the point so serving should be swapped to participant two"
        };
        yield return new object[]
        {
            new MatchEntity(
                "12345",
                DateTime.MinValue,
                DateTime.MaxValue,
                new NoUserParticipant("Tom Elvidge"),
                new NoUserParticipant("Joe Bloggs"),
                ParticipantEnum.One,
                TiebreakToTen.Create(),
                new List<StateEntity>() {
                    StateEntity.Initial(ParticipantEnum.One)
                }),
            ParticipantEnum.One,
            ParticipantEnum.Two,
            "the first point of a tiebreak is scored when participant one serves first so the serving should be swapped to participant two"
        };
    }

    [Theory]
    [MemberData(nameof(TestUpdateServingData))]
    public void TestUpdateServing(MatchEntity match, ParticipantEnum participant, ParticipantEnum expected, string because)
    {
        match.Update(participant);
        var newState = match.States
            .OrderBy(s => s.CreatedAtDateTime)
            .LastOrDefault()!;
        newState.Serving.Should().Be(expected, because);
    }

    [Fact]
    public void TestUpdateServingAfterTiebreak()
    {
        var match = MatchEntity.Create(
            "12345",
            new NoUserParticipant("Tom Elvidge"),
            new NoUserParticipant("Joe Bloggs"),
            ParticipantEnum.One,
            BestOfThree.Create());

        // participant one wins 5 games
        for (int i = 0; i < 5; i++)
        {
            for (int j = 0; j < 4; j++)
            {
                match.Update(ParticipantEnum.One);
            }
        }

        // participant two wins 6 games
        for (int i = 0; i < 6; i++)
        {
            for (int j = 0; j < 4; j++)
            {
                match.Update(ParticipantEnum.Two);
            }
        }

        // participant one wins another game to begin tiebreak
        for (int i = 0; i < 4; i++)
        {
            match.Update(ParticipantEnum.One);
        }

        match.States
            .OrderBy(s => s.CreatedAtDateTime)
            .Reverse()
            .FirstOrDefault()!
            .Serving.Should().Be(ParticipantEnum.One, "participant one initially served then twelve games were played so the serving participant has swapped twelve times back to participant one");

        // participant one wins the tiebreak game
        for (int i = 0; i < 7; i++)
        {
            match.Update(ParticipantEnum.One);
        }

        match.States
            .OrderBy(s => s.CreatedAtDateTime)
            .Reverse()
            .FirstOrDefault()!
            .Serving.Should().Be(ParticipantEnum.Two, "participant two initially received in the tiebreak so they should serve first in the game after the tiebreak");
    }
}
