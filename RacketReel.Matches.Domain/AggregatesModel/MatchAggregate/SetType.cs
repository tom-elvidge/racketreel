namespace RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

public enum SetType
{
    // just keep playing games until someone wins at least 6 with a 2 game margin
    SixAllAdvantageRule = 1,
    // sometimes called a 7 point tie break
    // first to 7 with a 2 point margin
    SixAllTwelvePointTiebreaker = 2,
    // first to 10 with a 2 point margin
    SixAllTenPointTiebreaker = 3,
    // play a 12 point tie break if the score reaches 12-12
    WimbledonFinalSet = 4,
    // single game in the set played as a 10 point tiebreak
    SuperTiebreaker = 5
}
