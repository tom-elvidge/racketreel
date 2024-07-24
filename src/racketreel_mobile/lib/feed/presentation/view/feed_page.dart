import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/create_match/presentation/view/create_match_page.dart';
import 'package:racketreel/feed/presentation/bloc/feed_bloc.dart';
import 'package:racketreel/feed/presentation/view/feed_item.dart';
import 'package:racketreel/match/presentation/view/match_page.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isNearEndOfScroll()) {
      context.read<FeedBloc>().add(const FetchOlderEvent());
    }
  }

  bool _isNearEndOfScroll()
  {
    // remaining scroll is equal to the height of the viewport
    var scrollOffset = _scrollController.offset;
    var maxScroll = _scrollController.position.maxScrollExtent;
    var viewportDimension = _scrollController.position.viewportDimension;
    return scrollOffset >= (maxScroll - viewportDimension);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                    icon: const Icon(Icons.add),
                    tooltip: 'Add',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateMatchPage())
                      );
                    }
                )
              ]
          ),
          body: SafeArea(
            child: state.fetchingInitial
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
              displacement: 20.0,
              onRefresh: () async => context
                  .read<FeedBloc>()
                  .add(const FetchInitialEvent()),
              child: Scrollbar(
                child: Builder(
                  builder: (BuildContext newContext) {
                    // Using the new context that has access to the BlocProvider
                    return CustomScrollView(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: <Widget>[
                        // Load new feed items when coming back to this page
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              final item = state.items[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: InkWell(
                                  child: FeedItem(feedItem: item),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MatchPage(matchId: item.matchId),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            childCount: state.items.length,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: state.fetchingOlder
                              ? Container(
                            padding: const EdgeInsets.all(20),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
