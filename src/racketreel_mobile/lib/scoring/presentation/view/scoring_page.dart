import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/injection.dart';
import 'package:racketreel/profile/bloc/profile_bloc.dart';
import 'package:racketreel/scoring/presentation/bloc/scoring_bloc.dart';
import 'package:racketreel/scoring/presentation/view/scoreboard.dart';
import 'package:racketreel/shared/domain/match_link_provider.dart';

class ScoringPage extends StatelessWidget {
  final int matchId;

  const ScoringPage({
    Key? key,
    required this.matchId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ScoringBloc>()..add(InitialScoringEvent(matchId)),
      child: BlocListener<ScoringBloc, ScoringState>(
          listener: (context, state) {
            if (state.userErrorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Container(
                    alignment: Alignment.center,
                    height: 20,
                    child: Text(state.userErrorMessage!),
                  ),
                ),
              );
            }
          },
          child: BlocBuilder<ScoringBloc, ScoringState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Scoring"),
                  actions: state.isInitializing
                    ? []
                    : <Widget>[
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        tooltip: 'More',
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_)
                            {
                              return BlocProvider.value(
                                value: BlocProvider.of<ScoringBloc>(context),
                                child: SafeArea(
                                  child: Wrap(
                                    children: [
                                      ListTile(
                                        title: const Text('Copy match link'),
                                        onTap: () async {
                                          await Clipboard.setData(ClipboardData(text: MatchLinkProvider.getMatchLink(state.matchId!)));

                                          if (!context.mounted) return;
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: const Text('Cancel match'),
                                        onTap: () {
                                          context
                                              .read<ScoringBloc>()
                                              .add(const DeleteMatchEvent());

                                          // todo: wait for response from bloc before popping the navigator
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
                body: WillPopScope(
                  onWillPop: () async {
                    if (state.matchState?.completed ?? false)
                    {
                      Navigator.of(context).popUntil(ModalRoute.withName('/'));
                      return true;
                    }
                    return (await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Stop scoring?'),
                        content: const Text(
                          'Matches can be resumed from your profile page.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).popUntil(ModalRoute.withName('/')),
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    )) ?? false;
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: state.isInitializing || state.matchState == null
                        ? const CircularProgressIndicator()
                        : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Scoreboard(
                                teamOneName: state.matchState!.teamOneName,
                                teamOneSets: state.matchState!.teamOneSets,
                                teamOneGames: state.matchState!.teamOneGames,
                                teamOnePoints: state.matchState!.teamOnePoints,
                                teamTwoName: state.matchState!.teamTwoName,
                                teamTwoSets: state.matchState!.teamTwoSets,
                                teamTwoGames: state.matchState!.teamTwoGames,
                                teamTwoPoints: state.matchState!.teamTwoPoints,
                                servingTeam: state.matchState!.servingTeam,
                              ),
                            ),
                            if (!(state.matchState?.completed ?? false))
                              FilledButton(
                                onPressed: () {
                                  context
                                      .read<ScoringBloc>()
                                      .add(const PointToTeamOneEvent());
                                },
                                child: Text('Point to ${state.matchState!.teamOneName}'),
                              ),
                            if (!(state.matchState?.completed ?? false))
                              FilledButton(
                                onPressed: () {
                                  context
                                      .read<ScoringBloc>()
                                      .add(const PointToTeamTwoEvent());
                                },
                                child: Text('Point to ${state.matchState!.teamTwoName}'),
                              ),
                            FilledButton(
                              onPressed: state.matchState?.version == 0 ? null :
                                () {
                                  context
                                      .read<ScoringBloc>()
                                      .add(const ToggleHighlightEvent());
                                },
                              child: state.isLastStateHighlighted
                                  ? const Text('Remove Highlight')
                                  : const Text('Highlight'),
                            ),
                            FilledButton(
                              onPressed: state.matchState?.version == 0 ? null :
                                () {
                                  context
                                      .read<ScoringBloc>()
                                      .add(const UndoEvent());
                                },
                              child: const Text('Undo'),
                            ),
                          ],
                        ),
                    ),
                  ),
                )
              );
            }
          )
        )
      );
  }
}