import 'package:injectable/injectable.dart';
import 'package:racketreel/feed/domain/feed_item_v2_entity.dart';
import 'package:racketreel/feed/domain/team_set_score.dart';
import 'package:racketreel/profile/user_service.dart';
import 'package:racketreel/shared/data/i_summary_data_source.dart';
import 'package:racketreel/feed/domain/feed_item_entity.dart';
import 'package:racketreel/feed/domain/i_feed_item_repository.dart';
import 'package:racketreel/client/matches.pb.dart' as service;
import 'package:racketreel/shared/data/repository_utils.dart';

@Injectable(as: IFeedItemRepository)
class FeedItemRepository implements IFeedItemRepository {
  late ISummaryDataSource _summaryDataSource;
  late IUserService _userService;

  FeedItemRepository({
    required ISummaryDataSource dataSource,
    required IUserService userService,
  }) {
    _summaryDataSource = dataSource;
    _userService = userService;
  }

  @override
  Future<List<FeedItemEntity>> getFeedItems(int pageNumber) async {
    List<service.Summary> response = await _summaryDataSource.getSummaries(pageNumber);

    List<FeedItemEntity> matches = List<FeedItemEntity>
        .generate(
        response.length, (index) => _createFeedItemEntity(response[index]));

    return matches;
  }

  FeedItemEntity _createFeedItemEntity(service.Summary summary) {
    return FeedItemEntity(
        summary.matchId,
        "${summary.teamOneName} vs ${summary.teamTwoName}",
        _getScoreText(summary),
        _getFormatText(summary.format),
        RepositoryUtils.getDateTimeString(summary.startedAtUtc.toDateTime()));
  }

  String _getScoreText(service.Summary summary) {
    var buffer = StringBuffer();
    buffer.write(_getSetText(summary.setOne));

    if (summary.hasSetTwo()) {
      buffer.write(", ");
      buffer.write(_getSetText(summary.setTwo));
    }

    if (summary.hasSetThree()) {
      buffer.write(", ");
      buffer.write(_getSetText(summary.setThree));
    }

    if (summary.hasSetFour()) {
      buffer.write(", ");
      buffer.write(_getSetText(summary.setFour));
    }

    if (summary.hasSetFive()) {
      buffer.write(", ");
      buffer.write(_getSetText(summary.setFive));
    }

    return buffer.toString();
  }

  String _getSetText(service.SetSummary setSummary) {
    var buffer = StringBuffer();
    buffer.write("${setSummary.teamOneGames}-${setSummary.teamTwoGames}");
    if (setSummary.tiebreak) {
      buffer.write("(${setSummary.teamOneTiebreakPoints}-${setSummary
          .teamTwoTiebreakPoints})");
    }
    return buffer.toString();
  }

  String _getFormatText(service.Format format) {
    switch (format) {
      case service.Format.BEST_OF_FIVE:
        return "Best of five sets";
      case service.Format.BEST_OF_FIVE_FST:
        return "Best of five sets with a final set tiebreak";
      case service.Format.BEST_OF_ONE:
        return "Single set";
      case service.Format.BEST_OF_THREE:
        return "Best of three sets";
      case service.Format.BEST_OF_THREE_FST:
        return "Best of three sets with a final set tiebreak";
      case service.Format.FAST4:
        return "FAST4";
      case service.Format.TIEBREAK_TO_TEN:
        return "Tiebreak to 10";
      default:
        return "Unknown match format";
    }
  }

  @override
  Future<List<FeedItemV2Entity>> getFeedItemsV2(int pageNumber) async {
    List<service.SummaryV2> response = await _summaryDataSource.getSummariesV2(pageNumber);

    var futures = <Future<FeedItemV2Entity>>[];

    for (var item in response) {
      futures.add(_createFeedItemV2Entity(item));
    }

    return await Future.wait(futures);
  }

  Future<FeedItemV2Entity> _createFeedItemV2Entity(service.SummaryV2 summary) async {
    var userInfo = await _userService.getUserInfo(summary.creatorUserId);

    return FeedItemV2Entity(
        summary.matchId,
        userInfo?.displayName ?? "Unknown User",
        _getFormatText(summary.format),
        summary.teamOneName,
        summary.teamTwoName,
        summary.teamOneSets.toString(),
        summary.teamTwoSets.toString(),
        summary.teamOneSets > summary.teamTwoSets,
        summary.teamOneSetScores.map((e) => TeamSetScore(
            e.setNumber,
            e.games,
            e.tiebreakPoints,
            e.setWon)).toList(),
        summary.teamTwoSetScores.map((e) => TeamSetScore(
            e.setNumber,
            e.games,
            e.tiebreakPoints,
            e.setWon)).toList(),
        RepositoryUtils.getDateTimeString(summary.startedAtUtc.toDateTime()),
        RepositoryUtils.getDurationString(summary.duration.seconds.toInt()));
  }
}