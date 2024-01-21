part of 'feed_bloc.dart';

@immutable
sealed class FeedState extends Equatable {
  final bool fetchingInitial;
  final bool fetchingOlder;
  final bool endOfFeed;
  final int lastPageFetched;
  final List<FeedItemV2Entity> items;

  const FeedState(this.fetchingInitial, this.fetchingOlder, this.endOfFeed, this.lastPageFetched, this.items);

  @override
  List<Object> get props => [fetchingInitial, fetchingOlder, endOfFeed, lastPageFetched, items];

  @override
  String toString() => 'FeedState { fetchingInitial: $fetchingInitial, fetchingOlder: $fetchingOlder, endOfFeed: $endOfFeed, lastPageFetched: $lastPageFetched, items: $items }';
}

final class FetchingInitial extends FeedState {
  const FetchingInitial() : super(true, false, false, -1, const []);

  @override
  String toString() => 'EmptyFeed ${super.toString()}';
}

final class FetchedInitial extends FeedState {
  FetchedInitial(endOfFeed, items) : super(false, false, endOfFeed, 1, items);

  @override
  String toString() => 'FetchedInitial ${super.toString()}';
}

final class FetchingOlder extends FeedState {
  FetchingOlder(endOfFeed, lastPageFetched, items) : super(false, true, endOfFeed, lastPageFetched, items);

  @override
  String toString() => 'FetchingOlder ${super.toString()}';
}

final class FetchedOlder extends FeedState {
  FetchedOlder(endOfFeed, lastPageFetched, items) : super(false, false, endOfFeed, lastPageFetched, items);

  @override
  String toString() => 'FetchedOlder ${super.toString()}';
}