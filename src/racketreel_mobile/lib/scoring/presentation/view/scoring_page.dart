import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/injection.dart';
import 'package:racketreel/scoring/presentation/bloc/scoring_bloc.dart';

class ScoringPage extends StatelessWidget {
  final int matchId;

  const ScoringPage({
    Key? key,
    required this.matchId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<ScoringBloc>(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Scoring"),
            ),
            body: BlocBuilder<ScoringBloc, ScoringState>(
                builder: (context, state) {
                  return Text("Scoring");
                }
            )
        )
    );
  }
}