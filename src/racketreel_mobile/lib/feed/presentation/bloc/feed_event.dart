part of 'feed_bloc.dart';

@immutable
sealed class FeedEvent {
  const FeedEvent();
}

final class FetchInitialEvent extends FeedEvent {
  const FetchInitialEvent();
}

final class FetchOlderEvent extends FeedEvent {
  const FetchOlderEvent();
}