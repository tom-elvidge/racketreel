part of 'feed_bloc.dart';

@immutable
sealed class FeedState extends Equatable {
  final bool fetchingInitial;
  final bool fetchingNextPage;
  final bool endOfFeed;
  final int lastPageFetched;
  final List<FeedItemEntity> items;

  const FeedState(this.fetchingInitial, this.fetchingNextPage, this.endOfFeed, this.lastPageFetched, this.items);

  @override
  List<Object> get props => [fetchingInitial];

  @override
  String toString() => 'FeedState { fetchingInitial: $fetchingInitial, fetchingNextPage: $fetchingNextPage, noMoreItems: $endOfFeed, lastPageFetched: $lastPageFetched, items: $items }';
}

final class EmptyFeed extends FeedState {
  const EmptyFeed() : super(true, false, false, -1, const []);

  @override
  String toString() => 'EmptyFeed ${super.toString()}';
}

final class PopulatedFeed extends FeedState {
  const PopulatedFeed(fetchingNextPage, items, endOfFeed, lastPageFetched) : super(false, fetchingNextPage, endOfFeed, lastPageFetched, items);

  @override
  String toString() => 'PopulatedFeed ${super.toString()}';
}