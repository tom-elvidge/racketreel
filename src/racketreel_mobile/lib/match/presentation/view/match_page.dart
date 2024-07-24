import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/injection.dart';
import 'package:racketreel/match/presentation/bloc/match_bloc.dart';

class MatchPage extends StatelessWidget {
  final int matchId;

  const MatchPage({
    Key? key,
    required this.matchId,
  }) : super(key: key);

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
      create: (_) => getIt<MatchBloc>()..add(FetchInitialEvent(matchId)),
      child: BlocBuilder<MatchBloc, MatchState>(
        builder: (context, state) {
          // fetch next page when near the end of the scroll
          var scrollController = PrimaryScrollController.of(context);

          scrollController.addListener(() {
            if (_isNearEndOfScroll(scrollController)) {
              context
                  .read<MatchBloc>()
                  .add(const FetchMatchStatesEvent());
            }
          });

          return Scaffold(
              appBar: AppBar(
                title: const Text("Match"),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    tooltip: 'More',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_)
                        {
                          return BlocProvider.value(
                            value: BlocProvider.of<MatchBloc>(context),
                            child: SafeArea(
                              child: Wrap(
                                children: [
                                  ListTile(
                                    title: const Text('Delete match'),
                                    onTap: () {
                                      context
                                          .read<MatchBloc>()
                                          .add(const DeleteMatchEvent());

                                      if (!context.mounted) return;

                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              body: state.fetchingSummary
                  ? const Center(child: CircularProgressIndicator())
                  : Scrollbar(
                child: CustomScrollView(
                  slivers: [
                    // Summary
                    SliverList(delegate: SliverChildListDelegate.fixed([
                      // TODO: create a summary component
                      Text(state.summary.datetime)
                    ])),
                    // Match states
                    SliverList(delegate: state.fetchingStates
                        ? const SliverChildListDelegate.fixed([
                      Center(child: CircularProgressIndicator())
                    ])
                        : SliverChildListDelegate(
                        state.states
                        // TODO: create a state component
                            .map((s) => Text(s.datetime))
                            .toList()
                    )),
                  ],
                ),
              )
          );
        }
      ),
    );
  }
}