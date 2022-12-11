using Xunit;
using FluentAssertions;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;
using System.Collections.Generic;
using System;
using System.Linq;

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
                Participant.One,
                true
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
                Participant.One,
                false
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

    [Fact]
    public void TestComputeMatchSummaryStraightSets()
    {
        // arrange
        var format = new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker);
        var match = new Match("Tom Elvidge", "Joe Bloggs", format, Participant.One);

        // act: participant one wins 6-0, 6-0
        for (int i = 0; i < 2; i++) // two sets
        {
            for (int j = 0; j < 6; j++) // six games
            {
                for (int k = 0; k < 4; k++) // four points
                {
                    match.AddState(Participant.One);
                }
            }
        }
        

        // assert
        match.Summary.Should().NotBeNull("The summary should be computed when the match is completed.");
        match.Summary!.Winner.Should().Be(Participant.One);
        // set 1
        var set1 = match.Summary.Sets.First(s => s.Set == 0);
        set1.ParticipantOneGames.Should().Be(6);
        set1.ParticipantTwoGames.Should().Be(0);
        set1.Winner.Should().Be(Participant.One);
        // set 2
        var set2 = match.Summary.Sets.First(s => s.Set == 1);
        set2.ParticipantOneGames.Should().Be(6);
        set2.ParticipantTwoGames.Should().Be(0);
        set2.Winner.Should().Be(Participant.One);
    }

    [Fact]
    public void TestComputeMatchSummaryWithTieBreak()
    {
        // arrange
        var format = new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker);
        var match = new Match("Tom Elvidge", "Joe Bloggs", format, Participant.One);

        // act
        // participant one wins until 5-0
        for (int j = 0; j < 5; j++) // five games
        {
            for (int k = 0; k < 4; k++) // four points
            {
                match.AddState(Participant.One);
            }
        }
        // participant two wins until 5-6
        for (int j = 0; j < 6; j++) // six games
        {
            for (int k = 0; k < 4; k++) // four points
            {
                match.AddState(Participant.Two);
            }
        }
        // participant one wins until 6-6 (7-0)
        for (int k = 0; k < 11; k++) // eleven points
        {
            match.AddState(Participant.One);
        }
        // participant two wins until 6-7 (7-10)
        for (int k = 0; k < 10; k++) // ten points
        {
            match.AddState(Participant.Two);
        }
        // participant two wins 6-7 (7-10), 6-0
        for (int j = 0; j < 6; j++) // six games
        {
            for (int k = 0; k < 4; k++) // four points
            {
                match.AddState(Participant.Two);
            }
        }

        // assert
        var summary = match.Summary;
        match.Summary.Should().NotBeNull("The summary should be computed when the match is completed.");
        match.Summary!.Winner.Should().Be(Participant.Two);
        // set 1
        var set1 = match.Summary.Sets.First(s => s.Set == 0);
        set1.ParticipantOneGames.Should().Be(6);
        set1.ParticipantTwoGames.Should().Be(7);
        set1.TieBreak.Should().BeTrue();
        set1.ParticipantOneTieBreakPoints.Should().Be(7);
        set1.ParticipantTwoTieBreakPoints.Should().Be(10);
        set1.Winner.Should().Be(Participant.Two);
        // set 2
        var set2 = match.Summary.Sets.First(s => s.Set == 1);
        set2.ParticipantOneGames.Should().Be(0);
        set2.ParticipantTwoGames.Should().Be(6);
        set2.Winner.Should().Be(Participant.Two);
    }
}