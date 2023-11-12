import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/injection.dart';
import 'package:racketreel/scoring/presentation/bloc/scoring_bloc.dart';
import 'package:racketreel/scoring/presentation/view/scoreboard.dart';

class ScoringPage extends StatelessWidget {
  final int matchId;

  const ScoringPage({
    Key? key,
    required this.matchId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ScoringBloc>()..add(const InitialScoringEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Scoring"),
        ),
        body: BlocListener<ScoringBloc, ScoringState>(
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
              return WillPopScope(
                onWillPop: () async {
                  if (state.isComplete)
                  {
                    Navigator.of(context).popUntil(ModalRoute.withName('/'));
                    return true;
                  }
                  return (await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text(
                        'This will cancel the match as it has not yet been completed.'),
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
                              teamOneName: state.matchState!.teamTwoName,
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
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ScoringBloc>()
                                  .add(const PointToTeamOneEvent());
                            },
                            child: Text('Point to ${state.matchState!.teamOneName}'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ScoringBloc>()
                                  .add(const PointToTeamTwoEvent());
                            },
                            child: Text('Point to ${state.matchState!.teamTwoName}'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ScoringBloc>()
                                  .add(const ToggleHighlightEvent());
                            },
                            child: state.isLastStateHighlighted
                                ? const Text('Remove Highlight')
                                : const Text('Highlight'),
                          ),
                          ElevatedButton(
                            onPressed: () {
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
              );
            }
          )
        )
      ),
    );
  }
}