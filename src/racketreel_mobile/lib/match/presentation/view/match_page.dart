import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/match/presentation/bloc/match_bloc.dart';

class MatchPage extends StatelessWidget {
  late final int matchId;

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
      create: (_) => MatchBloc()..add(const FetchInitialEvent()),
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
                        // TODO
                        // Summary component
                        // List of all the match states
                        // SliverList(delegate: SliverChildListDelegate())
                        // CircleProgressIndicator if fetching more states
                      ],
                    ),
                  );
          },
        )
      ),
    );
  }
}