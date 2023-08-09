import 'package:injectable/injectable.dart';
import 'package:racketreel/feed/data/i_completed_match_data_source.dart';
import 'package:racketreel/feed/domain/feed_item_entity.dart';
import 'package:racketreel/feed/data/completed_match_dto.dart';
import 'package:racketreel/feed/domain/i_feed_item_repository.dart';

@Injectable(as: IFeedItemRepository)
class FeedItemRepository implements IFeedItemRepository
{
  late ICompletedMatchDataSource _dataSource;

  FeedItemRepository({
    required ICompletedMatchDataSource dataSource,
  }) {
    _dataSource = dataSource;
  }

  @override
  List<FeedItemEntity> getFeedItems() {
    List<CompletedMatchDto> response = _dataSource.getMatches();

    List<FeedItemEntity> matches = List<FeedItemEntity>.generate(response.length, (index) => FeedItemEntity(
      "${response[index].playerOne} vs ${response[index].playerTwo}",
      response[index].summary,
      response[index].type,
      response[index].datetime));

    return matches;
  }
}