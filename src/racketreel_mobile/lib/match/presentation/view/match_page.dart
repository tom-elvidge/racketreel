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
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Match"),
        ),
        body: BlocBuilder<MatchBloc, MatchState>(
          builder: (context, state) {
            // fetch next page when near the end of the scroll
            var scrollController = PrimaryScrollController.of(context);
            scrollController.addListener(() {
              if (_isNearEndOfScroll(scrollController))
              {
                context
                    .read<MatchBloc>()
                    .add(const FetchMatchStatesEvent());
              }
            });

            return state.fetchingSummary
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
                          ? SliverChildListDelegate.fixed([
                            const Center(child: CircularProgressIndicator())
                          ])
                          : SliverChildListDelegate(
                            state.states
                              // TODO: create a state component
                              .map((s) => Text(s.datetime))
                              .toList()
                            )),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}