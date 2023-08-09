import 'package:racketreel/feed/domain/feed_item_entity.dart';

abstract interface class IFeedItemRepository
{
  List<FeedItemEntity> getFeedItems();
}