using Xunit;
using FluentAssertions;
using RacketReel.Domain;
using RacketReel.Domain.AggregatesModel.MatchAggregate.Formats;
using System.Collections.Generic;
using System;
using RacketReel.Domain.AggregatesModel.MatchAggregate;

namespace RacketReel.Domain.Tests;

public class ScorerTests
{
    public static IEnumerable<object[]> TestIsFinalSetData()
    {
        yield return new object[]
        {
            TiebreakToTen.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            true,
            "the TiebreakToTen format has a single set so the initial state must be the final set"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            false,
            "the BestOfThreeSevenPointTiebreaker format has three sets so the initial state cannot be the final set"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 1, 1)),
            true,
            "the BestOfThreeSevenPointTiebreaker format has three sets so when it is 1-1 it must be the final set"
        };
        yield return new object[]
        {
            BestOfFive.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 2, 1)),
            false,
            "the BestOfFiveSevenPointTiebreaker format has five sets so when it is 2-1 it cannot be the final set"
        };
        yield return new object[]
        {
            BestOfFive.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 2, 2)),
            true,
            "the BestOfFiveSevenPointTiebreaker format has five sets so when it is 2-2 it must be the final set"
        };
    }

    [Theory]
    [MemberData(nameof(TestIsFinalSetData))]
    public void TestIsFinalSet(Format format, StateEntity state, bool expected, string because)
    {
        Scorer.IsFinalSet(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> TestIsCompleteData()
    {
        yield return new object[]
        {
            BestOfFive.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            false,
            "the initial state cannot be complete"
        };
        yield return new object[]
        {
            BestOfFive.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 3, 2)),
            true,
            "the BestOfFiveSevenPointTiebreaker format has five sets so when it is 3-2 it must be complete"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 2, 0)),
            true,
            "the BestOfThreeSevenPointTiebreaker format has three sets so when it is 2-0 it must be complete"
        };
    }

    [Theory]
    [MemberData(nameof(TestIsCompleteData))]
    public void TestIsComplete(Format format, StateEntity state, bool expected, string because)
    {
        Scorer.IsComplete(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> TestIsTiebreakData()
    {
        yield return new object[]
        {
            TiebreakToTen.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            true,
            "the TiebreakToTen format is only a tiebreak so the initial state must be a tiebreak"
        };
        yield return new object[]
        {
            TiebreakToTen.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(5, 3, 0, 0, 0, 0)),
            true,
            "the TiebreakToTen format is only a tiebreak so the initial state must be a tiebreak and the score in points must not change this"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            false,
            "the BestOfThreeSevenPointTiebreaker format has six games per set so the initial state cannot be a tiebreak"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 6, 6, 0, 0)),
            true,
            "the BestOfThreeSevenPointTiebreaker format has six games per set so at 6-6 it must be a tiebreak"
        };
        yield return new object[]
        {
            FastFour.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 3, 3, 0, 0)),
            true,
            "the FastFour format has no game advantage and 4 games per set so tiebreaks are triggered early so at 3-3 it must be a tiebreak"
        };
        yield return new object[]
        {
            FastFour.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 1, 1)),
            true,
            "the FastFour format has only one game in the final set so the first point in the final set must be a tiebreak"
        };
    }

    [Theory]
    [MemberData(nameof(TestIsTiebreakData))]
    public void TestIsTiebreak(Format format, StateEntity state, bool expected, string because)
    {
        Scorer.IsTiebreak(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> GetMinimumPointsToWinCurrentGameData()
    {
        yield return new object[]
        {
            BestOfThree.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            4,
            "the BestOfThreeSevenPointTiebreaker format initial state is an ordinary game so the minimum points to win the game must be 4"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 6, 6, 0, 0)),
            7,
            "the BestOfThreeSevenPointTiebreaker format in the first set at 6-6 so the current game is a 7 point tiebreak so the minimum points to win the game must be 7"
        };
        yield return new object[]
        {
            TiebreakToTen.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            10,
            "the TiebreakToTen format is only a tiebreak so the current game is a 10 point tiebreak so the minimum points to win the game must be 10"
        };
        yield return new object[]
        {
            FastFour.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 3, 3, 0, 0)),
            7,
            "the FastFour format in the first set at 3-3 so the current game is a 7 point tiebreak so the minimum points to win the game must be 7"
        };
        yield return new object[]
        {
            FastFour.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 0, 0, 0, 1, 1)),
            10,
            "the FastFour format in the final set at 0-0 so the current game is a 10 point tiebreak so the minimum points to win the game must be 10"
        };
    }

    [Theory]
    [MemberData(nameof(GetMinimumPointsToWinCurrentGameData))]
    public void TestGetMinimumPointsToWinCurrentGame(Format format, StateEntity state, int expected, string because)
    {
        Scorer.GetMinimumPointsToWinCurrentGame(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> GetGamePointParticipantData()
    {
        yield return new object[]
        {
            TiebreakToTen.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            ParticipantSelectorEnum.Neither,
            "there cannot be a game point to either player on the initial state"
        };
        yield return new object[]
        {
            TiebreakToTen.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(9, 8, 0, 0, 0, 0)),
            ParticipantSelectorEnum.One,
            "the TiebreakToTen format and the first participant is one point off the needed 10"
        };
        yield return new object[]
        {
            TiebreakToTen.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(9, 9, 0, 0, 0, 0)),
            ParticipantSelectorEnum.Neither,
            "the TiebreakToTen format and participant one is a single point off the needed 10 but so is participant two"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(3, 0, 0, 0, 0, 0)),
            ParticipantSelectorEnum.One,
            "the BestOfThreeSevenPointTiebreaker format and an ordinary game where participant one is a single point off the needed 4"
        };
        yield return new object[]
        {
            FastFour.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(3, 3, 0, 0, 0, 0)),
            ParticipantSelectorEnum.Both,
            "the FastFour format with sudden death deuce and both participants are a single point off the needed 4"
        };
    }

    [Theory]
    [MemberData(nameof(GetGamePointParticipantData))]
    public void TestGetGamePointParticipant(Format format, StateEntity state, ParticipantSelectorEnum expected, string because)
    {
        Scorer.GetGamePointParticipant(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> GetSetPointParticipantData()
    {
        yield return new object[]
        {
            TiebreakToTen.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            ParticipantSelectorEnum.Neither,
            "there cannot be a set point to either player on the initial state"
        };
        yield return new object[]
        {
            TiebreakToTen.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(9, 8, 0, 0, 0, 0)),
            ParticipantSelectorEnum.One,
            "the TiebreakToTen format so only one game in the set and the first participant is one point off the needed 10 for the game and set"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(3, 0, 0, 0, 0, 0)),
            ParticipantSelectorEnum.Neither,
            "the BestOfThreeSevenPointTiebreaker format where it is game point but only the first game of the set so not set point"
        };
        yield return new object[]
        {
            FastFour.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 6, 3, 3, 0, 0)),
            ParticipantSelectorEnum.Two,
            "the FastFour format where participant two is one point off winning the tiebreak for the set so must be set point"
        };
    }

    [Theory]
    [MemberData(nameof(GetSetPointParticipantData))]
    public void TestGetSetPointParticipant(Format format, StateEntity state, ParticipantSelectorEnum expected, string because)
    {
        Scorer.GetSetPointParticipant(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> GetMatchPointParticipantData()
    {
        yield return new object[]
        {
            TiebreakToTen.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            ParticipantSelectorEnum.Neither,
            "there cannot be a match point to either player on the initial state"
        };
        yield return new object[]
        {
            TiebreakToTen.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(9, 0, 0, 0, 0, 0)),
            ParticipantSelectorEnum.One,
            "participant one is one point winning the game in a match which only has one set and one game"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 3, 0, 5, 1, 1)),
            ParticipantSelectorEnum.Two,
            "participant two is one point off winning the last game to win the last set 6-0"
        };
    }

    [Theory]
    [MemberData(nameof(GetMatchPointParticipantData))]
    public void TestGetMatchPointParticipant(Format format, StateEntity state, ParticipantSelectorEnum expected, string because)
    {
        Scorer.GetSetPointParticipant(format, state).Should().Be(expected, because);
    }

    public static IEnumerable<object[]> GewNewScoreData()
    {
        yield return new object[]
        {
            BestOfThree.Create(),
            StateEntity.Initial(ParticipantEnum.One),
            ParticipantEnum.One,
            new Score(1, 0, 0, 0, 0, 0),
            "when participant one scores the first point of the match it should be one love"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(3, 4, 0, 0, 0, 0)),
            ParticipantEnum.One,
            new Score(3, 3, 0, 0, 0, 0),
            "it is advantage to participant two but participant one scores so it should go back to deuce"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(4, 3, 0, 0, 0, 0)),
            ParticipantEnum.Two,
            new Score(3, 3, 0, 0, 0, 0),
            "it is advantage to participant one but participant two scores so it should go back to deuce"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(3, 0, 0, 0, 0, 0)),
            ParticipantEnum.One,
            new Score(0, 0, 1, 0, 0, 0),
            "it is game point to participant one and then they score so their games should be incremented"
        };
        yield return new object[]
        {
            BestOfThree.Create(),
            new StateEntity(
                DateTime.MinValue,
                ParticipantEnum.One,
                new Score(0, 3, 0, 5, 0, 0)),
            ParticipantEnum.Two,
            new Score(0, 0, 0, 0, 0, 1),
            "it is set point to participant two and then they score so their sets should be incremented"
        };
    }

    [Theory]
    [MemberData(nameof(GewNewScoreData))]
    public void TestGetNewScore(Format format, StateEntity state, ParticipantEnum participant, Score expected, string because)
    {
        Scorer.GetNewScore(format, state, participant).Should().Be(expected, because);
    }
}