using Xunit;
using FluentAssertions;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;
using System.Collections.Generic;
using System;

namespace RacketReel.Services.Matches.Domain.Tests;

public class TestMatchAggregate
{
    [Fact]
    public void TestPointToParticipantOneIncrementsParticipantOnePoints()
    {
        // arrange
        var format = new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker);
        var match = new Match("Tom Elvidge", "Joe Bloggs", format, Participant.One);
        
        // act
        match.AddState(Participant.One);

        // assert
        var latestState = match.GetLatestState();
        latestState.Score.ParticipantOnePoints.Should().Be(1);
        latestState.Score.ParticipantTwoPoints.Should().Be(0);
    }

    [Fact]
    public void TestFourPointsToParticipantOneIncrementsParticipantOneGames()
    {
        // arrange
        var format = new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker);
        var match = new Match("Tom Elvidge", "Joe Bloggs", format, Participant.One);
        
        // act
        for (int i = 0; i < 4; i++) // four points
        {
            match.AddState(Participant.One);
        }

        // assert
        var latestState = match.GetLatestState();
        latestState.Score.ParticipantOnePoints.Should().Be(0);
        latestState.Score.ParticipantOneGames.Should().Be(1);
        latestState.Score.ParticipantTwoPoints.Should().Be(0);
        latestState.Score.ParticipantTwoGames.Should().Be(0);
    }

    [Fact]
    public void TestSixGamesToParticipantOneIncrementsParticipantOneSets()
    {
        // arrange
        var format = new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker);
        var match = new Match("Tom Elvidge", "Joe Bloggs", format, Participant.One);
        
        // act
        for (int i = 0; i < 6; i++) // six games
        {
            for (int j = 0; j < 4; j++) // four points
            {
                match.AddState(Participant.One);
            }
        }

        // assert
        var latestState = match.GetLatestState();
        latestState.Score.ParticipantOnePoints.Should().Be(0);
        latestState.Score.ParticipantOneGames.Should().Be(0);
        latestState.Score.ParticipantOneSets.Should().Be(1);
        latestState.Score.ParticipantTwoPoints.Should().Be(0);
        latestState.Score.ParticipantTwoGames.Should().Be(0);
        latestState.Score.ParticipantTwoSets.Should().Be(0);
    }

    [Fact]
    public void TestServingParticipantSwapsAfterAGame()
    {
        // arrange
        var format = new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker);
        var match = new Match("Tom Elvidge", "Joe Bloggs", format, Participant.One);
        
        // act
        for (int i = 0; i < 4; i++) // four points
        {
            match.AddState(Participant.One);
        }

        // assert
        var latestState = match.GetLatestState();
        latestState.Serving.Should().Be(Participant.Two);
    }

    public static IEnumerable<object[]> TieBreakStates()
    {
        yield return new object[]
        {
            new Match(
                "Tom Elvidge",
                "Joe Bloggs",
                new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker),
                Participant.One
            ),
            new State(
                new DateTime(2022, 1, 1, 0, 0, 0),
                new Score(0, 0, 6, 6, 0, 0),
                Participant.One
            ),
            true,
            "6-6 in games so must be in tie break"
        };
    }

    [Theory]
    [MemberData(nameof(TieBreakStates))]
    public void TestIsTieBreakReturnsExpected(Match match, State state, bool expectedIsTieBreak, string because)
    {
        // act
        var actualIsTieBreak = match.IsTieBreak(state);

        // assert
        actualIsTieBreak.Should().Be(expectedIsTieBreak, because);
    }

    public static IEnumerable<object[]> CompleteStates()
    {
        yield return new object[]
        {
            new Match(
                "Tom Elvidge",
                "Joe Bloggs",
                new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker),
                Participant.One
            ),
            new State(
                new DateTime(2022, 1, 1, 0, 0, 0),
                new Score(0, 0, 0, 0, 2, 0),
                Participant.One
            ),
            true,
            "2 sets to love in a match with 3 sets"
        };
    }

    [Theory]
    [MemberData(nameof(CompleteStates))]
    public void TestIsCompleteReturnsExpected(Match match, State state, bool expectedIsComplete, string because)
    {
        // act
        var actualIsComplete = match.IsComplete(state);

        // assert
        actualIsComplete.Should().Be(expectedIsComplete, because);
    }
}