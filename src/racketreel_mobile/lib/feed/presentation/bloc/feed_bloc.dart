import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:racketreel/feed/domain/feed_item_entity.dart';
import 'package:racketreel/feed/domain/i_feed_item_repository.dart';

part 'feed_event.dart';
part 'feed_state.dart';

@injectable
class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final IFeedItemRepository repo;

  FeedBloc(this.repo) : super(const FeedInitial()) {
    on<FetchFeedEvent>(_onFetch);
  }

  void _onFetch(FetchFeedEvent event, Emitter<FeedState> emit)
  {
    emit(FeedPopulated(repo.getFeedItems()));
  }
}
