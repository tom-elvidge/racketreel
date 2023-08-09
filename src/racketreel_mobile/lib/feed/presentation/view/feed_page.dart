import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/feed/presentation/bloc/feed_bloc.dart';
import 'package:racketreel/feed/presentation/view/feed_item.dart';
import 'package:racketreel/injection.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // todo: dependency inject FeedBloc and it's dependencies
      create: (_) => getIt<FeedBloc>()..add(const FetchFeedEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Matches'),
        ),
        body: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            return state.loadingInitial
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
              displacement: 20.0,
              onRefresh: () async => context
                  .read<FeedBloc>()
                  .add(const FetchFeedEvent()),
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
                          if (state.loadingOlder)
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
