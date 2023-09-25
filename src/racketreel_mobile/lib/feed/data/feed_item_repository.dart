import 'package:injectable/injectable.dart';
import 'package:racketreel/shared/data/i_summary_data_source.dart';
import 'package:racketreel/feed/domain/feed_item_entity.dart';
import 'package:racketreel/feed/domain/i_feed_item_repository.dart';
import 'package:racketreel/client/matches.pb.dart';
import 'package:racketreel/shared/data/repository_utils.dart';

@Injectable(as: IFeedItemRepository)
class FeedItemRepository implements IFeedItemRepository
{
  late ISummaryDataSource _dataSource;

  FeedItemRepository({
    required ISummaryDataSource dataSource,
  }) {
    _dataSource = dataSource;
  }

  @override
  Future<List<FeedItemEntity>> getFeedItems(int pageNumber) async {
    List<Summary> response = await _dataSource.getSummaries(pageNumber);

    List<FeedItemEntity> matches = List<FeedItemEntity>
        .generate(response.length, (index) => _createFeedItemEntity(response[index]));

    return matches;
  }

  FeedItemEntity _createFeedItemEntity(Summary summary)
  {
    return FeedItemEntity(
        summary.matchId,
        "${summary.teamOneName} vs ${summary.teamTwoName}",
        _getScoreText(summary),
        _getFormatText(summary.format),
        RepositoryUtils.getDateTimeString(summary.startedAtUtc.toDateTime()));
  }

  String _getScoreText(Summary summary)
  {
    var buffer = StringBuffer();
    buffer.write(_getSetText(summary.setOne));

    if (summary.hasSetTwo())
    {
      buffer.write(", ");
      buffer.write(_getSetText(summary.setTwo));
    }

    if (summary.hasSetThree())
    {
      buffer.write(", ");
      buffer.write(_getSetText(summary.setThree));
    }

    if (summary.hasSetFour())
    {
      buffer.write(", ");
      buffer.write(_getSetText(summary.setFour));
    }

    if (summary.hasSetFive())
    {
      buffer.write(", ");
      buffer.write(_getSetText(summary.setFive));
    }

    return buffer.toString();
  }

  String _getSetText(SetSummary setSummary)
  {
    var buffer = StringBuffer();
    buffer.write("${setSummary.teamOneGames}-${setSummary.teamTwoGames}");
    if (setSummary.tiebreak) {
      buffer.write("(${setSummary.teamOneTiebreakPoints}-${setSummary.teamTwoTiebreakPoints})");
    }
    return buffer.toString();
  }

  String _getFormatText(Format format)
  {
    switch (format)
    {
      case Format.BEST_OF_FIVE:
        return "Best of five sets";
      case Format.BEST_OF_FIVE_FST:
        return "Best of five sets with a final set tiebreak";
      case Format.BEST_OF_ONE:
        return "Single set";
      case Format.BEST_OF_THREE:
        return "Best of three sets";
      case Format.BEST_OF_THREE_FST:
        return "Best of three sets with a final set tiebreak";
      case Format.FAST4:
        return "FAST4";
      case Format.TIEBREAK_TO_TEN:
        return "Tiebreak to 10";
      default:
        return "Unknown match format";
    }
  }
}