import 'package:racketreel/client/google/protobuf/timestamp.pb.dart';
import 'package:racketreel/client/google/protobuf/duration.pb.dart';
import 'package:racketreel/client/matches.pb.dart';
import 'package:racketreel/shared/data/i_summary_data_source.dart';

// @Injectable(as: ISummaryDataSource)
class StaticSummaryDataSource implements ISummaryDataSource
{
  @override
  Future<List<Summary>> getSummaries(int pageNumber) {
    return Future.value(<Summary>[ _dummySummary() ]);
  }

  @override
  Future<Summary> getSummary(int matchId) {
    return Future.value(_dummySummary());
  }

  Summary _dummySummary() {
    var summary = Summary();
    summary.startedAtUtc = Timestamp.fromDateTime(DateTime(2023, 8, 11));
    summary.completedAtUtc = Timestamp.fromDateTime(DateTime(2023, 8, 11));
    summary.duration = Duration.create();
    summary.format = Format.BEST_OF_THREE;
    summary.teamOneName = "Tom Elvidge";
    summary.teamTwoName = "Joe Bloggs";
    summary.matchId = 1;

    summary.setOne = SetSummary();
    summary.setOne.teamOneGames = 6;
    summary.setOne.teamTwoGames = 4;
    summary.setOne.tiebreak = false;

    summary.setTwo = SetSummary();
    summary.setTwo.teamOneGames = 4;
    summary.setTwo.teamTwoGames = 6;
    summary.setTwo.tiebreak = false;

    summary.setThree = SetSummary();
    summary.setThree.teamOneGames = 7;
    summary.setThree.teamTwoGames = 6;
    summary.setThree.tiebreak = true;
    summary.setThree.teamOneTiebreakPoints = 11;
    summary.setThree.teamTwoTiebreakPoints = 9;

    return summary;
  }

  @override
  Future<List<SummaryV2>> getSummariesV2(int pageNumber) {
    // TODO: implement getSummariesV2
    throw UnimplementedError();
  }

  @override
  Future<SummaryV2> getSummaryV2(int matchId) {
    // TODO: implement getSummaryV2
    throw UnimplementedError();
  }
}