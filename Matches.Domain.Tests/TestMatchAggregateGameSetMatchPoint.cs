using Xunit;
using FluentAssertions;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;
using System;
using System.Collections.Generic;

namespace RacketReel.Services.Matches.Domain.Tests;

public class IsGameSetMatchPointTests
{

    public static IEnumerable<object?[]> GamePointStates()
    {
        yield return new object?[]
        {
            new Match(
                "Tom Elvidge",
                "Joe Bloggs",
                new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker),
                Participant.One
            ),
            new State(
                new DateTime(2022, 1, 1, 0, 0, 0),
                new Score(2, 0, 0, 0, 0, 0),
                Participant.One
            ),
            null,
            "normal game which is 30-love so participant one needs two points not one"
        };

        yield return new object?[]
        {
            new Match(
                "Tom Elvidge",
                "Joe Bloggs",
                new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker),
                Participant.One
            ),
            new State(
                new DateTime(2022, 1, 1, 0, 0, 0),
                new Score(3, 3, 0, 0, 0, 0),
                Participant.One
            ),
            null,
            "normal game which is deuce so either participant needs two points not one"
        };

        yield return new object?[]
        {
            new Match(
                "Tom Elvidge",
                "Joe Bloggs",
                new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTenPointTiebreaker),
                Participant.One
            ),
            new State(
                new DateTime(2022, 1, 1, 0, 0, 0),
                new Score(3, 0, 0, 0, 0, 0),
                Participant.One
            ),
            Participant.One,
            "normal game which is 40-love so participant one only needs one more point"
        };
    }

    public static IEnumerable<object?[]> SetPointStates()
    {
        yield return new object?[]
        {
            new Match(
                "Tom Elvidge",
                "Joe Bloggs",
                new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTwelvePointTiebreaker),
                Participant.One
            ),
            new State(
                new DateTime(2022, 1, 1, 0, 0, 0),
                new Score(9, 0, 6, 6, 0, 0),
                Participant.One
            ),
            Participant.One,
            "in the first set so 10 point tie breaker and participant one only needs one point for the required 10"
        };
    }

    public static IEnumerable<object?[]> MatchPointStates()
    {
        yield return new object?[]
        {
            new Match(
                "Tom Elvidge",
                "Joe Bloggs",
                new Format(3, SetType.SixAllTenPointTiebreaker, SetType.SixAllTwelvePointTiebreaker),
                Participant.One
            ),
            new State(
                new DateTime(2022, 1, 1, 0, 0, 0),
                new Score(6, 0, 6, 6, 1, 1), // final set twelve point tie break
                Participant.One
            ),
            Participant.One,
            "in the final set which is a 12 point tie break and participant one only needs one point for the required 7"
        };
    }

    [Theory]
    [MemberData(nameof(GamePointStates))]
    // set points and match points must also be game points
    [MemberData(nameof(SetPointStates))]
    [MemberData(nameof(MatchPointStates))]
    public void TestIsGamePointToReturnsExpectedParticipant(Match match, State state, Participant? expectedGamePointTo, string because)
    {
        // act
        var actualGamePointTo = match.IsGamePointTo(state);

        // assert
        actualGamePointTo.Should().Be(expectedGamePointTo, because);
    }

    [Theory]
    [MemberData(nameof(SetPointStates))]
    // match points must also be set points
    [MemberData(nameof(MatchPointStates))]
    public void TestIsSetPointToReturnsExpectedParticipant(Match match, State state, Participant? expectedSetPointTo, string because)
    {
        // act
        var actualSetPointTo = match.IsSetPointTo(state);

        // assert
        actualSetPointTo.Should().Be(expectedSetPointTo, because);
    }

    [Theory]
    [MemberData(nameof(MatchPointStates))]
    public void TestIsMatchPointToReturnsExpectedParticipant(Match match, State state, Participant? expectedMatchPointTo, string because)
    {
        // act
        var actualMatchPointTo = match.IsMatchPointTo(state);

        // assert
        actualMatchPointTo.Should().Be(expectedMatchPointTo, because);
    }

}