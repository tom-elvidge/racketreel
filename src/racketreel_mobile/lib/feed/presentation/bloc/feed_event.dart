part of 'feed_bloc.dart';

@immutable
sealed class FeedEvent {
  const FeedEvent();
}

final class InitialFetchFeedEvent extends FeedEvent {
  const InitialFetchFeedEvent();
}

final class FetchNextPageFeedEvent extends FeedEvent {
  const FetchNextPageFeedEvent();
}