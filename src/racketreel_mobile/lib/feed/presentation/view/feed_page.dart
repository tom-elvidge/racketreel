import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/feed/presentation/bloc/feed_bloc.dart';
import 'package:racketreel/feed/presentation/view/feed_item.dart';
import 'package:racketreel/injection.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  bool _isNearEndOfScroll(ScrollController scrollController)
  {
    // remaining scroll is equal to the height of the viewport
    var scrollOffset = scrollController.offset;
    var maxScroll = scrollController.position.maxScrollExtent;
    var viewportDimension = scrollController.position.viewportDimension;
    return scrollOffset >= (maxScroll - viewportDimension);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // todo: dependency inject FeedBloc and it's dependencies
      create: (_) => getIt<FeedBloc>()..add(const FetchInitialEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Matches'),
        ),
        body: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            // fetch next page when near the end of the scroll
            var scrollController = PrimaryScrollController.of(context);
            scrollController.addListener(() {
              if (_isNearEndOfScroll(scrollController))
                {
                  context
                      .read<FeedBloc>()
                      .add(const FetchOlderEvent());
                }
            });

            return state.fetchingInitial
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
              displacement: 20.0,
              onRefresh: () async => context
                  .read<FeedBloc>()
                  .add(const FetchInitialEvent()),
              child: Scrollbar(
                child: CustomScrollView(
                  slivers: <Widget>[
                    // todo: load new feed items when coming back to this page
                    SliverList(
                      delegate: SliverChildListDelegate(
                        state.items.map((item) => InkWell(
                          child: FeedItem(feedItem: item),
                          // todo: match details view
                          onTap: () {},
                        )).toList(),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        [
                          if (state.fetchingOlder)
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
