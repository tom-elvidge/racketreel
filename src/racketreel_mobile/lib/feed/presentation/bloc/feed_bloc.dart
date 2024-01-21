import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:racketreel/feed/domain/feed_item_v2_entity.dart';
import 'package:racketreel/feed/domain/i_feed_item_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'feed_event.dart';
part 'feed_state.dart';

const throttleDuration = Duration(milliseconds: 1000);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final IFeedItemRepository repo;

  FeedBloc(this.repo) : super(const FetchingInitial()) {
    on<FetchInitialEvent>(_onInitialFetch);
    on<FetchOlderEvent>(
      _onFetchNextPage,
      transformer: throttleDroppable(throttleDuration));
  }

  void _onInitialFetch(FetchInitialEvent event, Emitter<FeedState> emit) async {
    var feedItems = await repo.getFeedItemsV2(1);
    emit(FetchedInitial(feedItems.isEmpty, feedItems));
  }

  void _onFetchNextPage(FetchOlderEvent event, Emitter<FeedState> emit) async {
    // do not fetch the next page if we are already at the end of the feed
    // do not fetch the next page if we are already fetching it
    if (state.endOfFeed || state.fetchingOlder) {
      return;
    }

    emit(FetchingOlder(state.endOfFeed, state.lastPageFetched, state.items));

    var page = state.lastPageFetched + 1;
    var feedItems = await repo.getFeedItemsV2(page);
    emit(FetchedOlder(feedItems.isEmpty, page, List<FeedItemV2Entity>.from(state.items)..addAll(feedItems)));
  }
}
