using Xunit;
using FluentAssertions;
using Matches.Domain;
using Matches.Domain.AggregatesModel.MatchAggregate.Formats;
using System.Collections.Generic;
using System;
using Matches.Domain.AggregatesModel.MatchAggregate;

namespace Matches.Domain.Tests;

public class ScorerTests
{
    public static IEnumerable<object[]> TestIsFinalSetData()
    {
        yield return new object[]
        {
            TiebreakToTen.Create(),
            State.Initial(ParticipantEnum.One),
            true,
            "the TiebreakToTen format has a single set so the initial state must be the final set"
        };
        yield return new object[]
        {
            BestOfThreeSevenPointTiebreaker.Create(),
            State.Initial(ParticipantEnum.One),
            false,
            "the BestOfThreeSevenPointTiebreaker format has three sets so the initial state cannot be the final set"
        };
        yield return new object[]
        {
            BestOfThreeSevenPointTiebreaker.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 1, 1)),
            true,
            "the BestOfThreeSevenPointTiebreaker format has three sets so when it is 1-1 it must be the final set"
        };
        yield return new object[]
        {
            BestOfFiveSevenPointTiebreaker.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 2, 1)),
            false,
            "the BestOfFiveSevenPointTiebreaker format has five sets so when it is 2-1 it cannot be the final set"
        };
        yield return new object[]
        {
            BestOfFiveSevenPointTiebreaker.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 2, 2)),
            true,
            "the BestOfFiveSevenPointTiebreaker format has five sets so when it is 2-2 it must be the final set"
        };
    }

    [Theory]
    [MemberData(nameof(TestIsFinalSetData))]
    public void TestIsFinalSet(Format format, State state, bool expected, string because)
    {
        Scorer.IsFinalSet(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> TestIsCompleteData()
    {
        yield return new object[]
        {
            BestOfFiveSevenPointTiebreaker.Create(),
            State.Initial(ParticipantEnum.One),
            false,
            "the initial state cannot be complete"
        };
        yield return new object[]
        {
            BestOfFiveSevenPointTiebreaker.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 3, 2)),
            true,
            "the BestOfFiveSevenPointTiebreaker format has five sets so when it is 3-2 it must be complete"
        };
        yield return new object[]
        {
            BestOfThreeSevenPointTiebreaker.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 2, 0)),
            true,
            "the BestOfThreeSevenPointTiebreaker format has three sets so when it is 2-0 it must be complete"
        };
    }

    [Theory]
    [MemberData(nameof(TestIsCompleteData))]
    public void TestIsComplete(Format format, State state, bool expected, string because)
    {
        Scorer.IsComplete(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> TestIsTiebreakData()
    {
        yield return new object[]
        {
            TiebreakToTen.Create(),
            State.Initial(ParticipantEnum.One),
            true,
            "the TiebreakToTen format is only a tiebreak so the initial state must be a tiebreak"
        };
        yield return new object[]
        {
            TiebreakToTen.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(5, 3, 0, 0, 0, 0)),
            true,
            "the TiebreakToTen format is only a tiebreak so the initial state must be a tiebreak and the score in points must not change this"
        };
        yield return new object[]
        {
            BestOfThreeSevenPointTiebreaker.Create(),
            State.Initial(ParticipantEnum.One),
            false,
            "the BestOfThreeSevenPointTiebreaker format has six games per set so the initial state cannot be a tiebreak"
        };
        yield return new object[]
        {
            BestOfThreeSevenPointTiebreaker.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 6, 6, 0, 0)),
            true,
            "the BestOfThreeSevenPointTiebreaker format has six games per set so at 6-6 it must be a tiebreak"
        };
        yield return new object[]
        {
            FastFour.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 3, 3, 0, 0)),
            true,
            "the FastFour format has no game advantage and 4 games per set so tiebreaks are triggered early so at 3-3 it must be a tiebreak"
        };
        yield return new object[]
        {
            FastFour.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 1, 1)),
            true,
            "the FastFour format has only one game in the final set so the first point in the final set must be a tiebreak"
        };
    }

    [Theory]
    [MemberData(nameof(TestIsTiebreakData))]
    public void TestIsTiebreak(Format format, State state, bool expected, string because)
    {
        Scorer.IsTiebreak(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> GetMinimumPointsToWinCurrentGameData()
    {
        yield return new object[]
        {
            BestOfThreeSevenPointTiebreaker.Create(),
            State.Initial(ParticipantEnum.One),
            4,
            "the BestOfThreeSevenPointTiebreaker format initial state is an ordinary game so the minimum points to win the game must be 4"
        };
        yield return new object[]
        {
            BestOfThreeSevenPointTiebreaker.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 6, 6, 0, 0)),
            7,
            "the BestOfThreeSevenPointTiebreaker format in the first set at 6-6 so the current game is a 7 point tiebreak so the minimum points to win the game must be 7"
        };
        yield return new object[]
        {
            TiebreakToTen.Create(),
            State.Initial(ParticipantEnum.One),
            10,
            "the TiebreakToTen format is only a tiebreak so the current game is a 10 point tiebreak so the minimum points to win the game must be 10"
        };
        yield return new object[]
        {
            FastFour.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 1, 1)),
            7,
            "the FastFour format in the final set at 0-0 so the current game is a 10 point tiebreak so the minimum points to win the game must be 10"
        };
    }

    [Theory]
    [MemberData(nameof(GetMinimumPointsToWinCurrentGameData))]
    public void TestGetMinimumPointsToWinCurrentGame(Format format, State state, int expected, string because)
    {
        Scorer.GetMinimumPointsToWinCurrentGame(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> GetGamePointParticipantData()
    {
        yield return new object[]
        {
            TiebreakToTen.Create(),
            State.Initial(ParticipantEnum.One),
            ParticipantSelectorEnum.Neither,
            "there cannot be a game point to either player on the initial state"
        };
        yield return new object[]
        {
            TiebreakToTen.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(9, 8, 0, 0, 0, 0)),
            ParticipantSelectorEnum.One,
            "the TiebreakToTen format and the first participant is one point off the needed 10"
        };
        yield return new object[]
        {
            TiebreakToTen.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(9, 9, 0, 0, 0, 0)),
            ParticipantSelectorEnum.Neither,
            "the TiebreakToTen format and participant one is a single point off the needed 10 but so is participant two"
        };
        yield return new object[]
        {
            BestOfThreeSevenPointTiebreaker.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(3, 0, 0, 0, 0, 0)),
            ParticipantSelectorEnum.One,
            "the BestOfThreeSevenPointTiebreaker format and an ordinary game where participant one is a single point off the needed 4"
        };
        yield return new object[]
        {
            FastFour.Create(),
            new State(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(3, 3, 0, 0, 0, 0)),
            ParticipantSelectorEnum.Both,
            "the FastFour format with sudden death deuce and both participants are a single point off the needed 4"
        };
    }

    [Theory]
    [MemberData(nameof(GetGamePointParticipantData))]
    public void TestGetGamePointParticipant(Format format, State state, ParticipantSelectorEnum expected, string because)
    {
        Scorer.GetGamePointParticipant(format, state).Should().Be(expected, because);
    }
}