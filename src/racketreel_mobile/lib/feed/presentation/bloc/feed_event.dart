part of 'feed_bloc.dart';

@immutable
sealed class FeedEvent {
  const FeedEvent();
}

final class FetchFeedEvent extends FeedEvent {
  const FetchFeedEvent();
}