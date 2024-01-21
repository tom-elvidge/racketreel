import 'package:racketreel/feed/domain/feed_item_entity.dart';
import 'package:racketreel/feed/domain/feed_item_v2_entity.dart';

abstract interface class IFeedItemRepository
{
  Future<List<FeedItemEntity>> getFeedItems(int pageNumber);
  Future<List<FeedItemV2Entity>> getFeedItemsV2(int pageNumber);
}