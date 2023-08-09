part of 'feed_bloc.dart';

@immutable
sealed class FeedState extends Equatable {
  final bool loadingInitial;
  final bool loadingOlder;
  final List<FeedItemEntity> items;

  const FeedState(this.loadingInitial, this.loadingOlder, this.items);

  @override
  List<Object> get props => [loadingInitial];
}

final class FeedInitial extends FeedState {
  const FeedInitial() : super(true, false, const []);

  @override
  String toString() => 'FeedInitial { loadingInitial: $loadingInitial, loadingOlder: $loadingOlder, items: $items }';
}

final class FeedPopulated extends FeedState {
  const FeedPopulated(items) : super(false, false, items);

  @override
  String toString() => 'FeedPopulated { loadingInitial: $loadingInitial, loadingOlder: $loadingOlder, items: $items }';
}