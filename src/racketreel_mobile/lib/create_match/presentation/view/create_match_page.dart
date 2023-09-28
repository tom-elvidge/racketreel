import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/create_match/presentation/bloc/create_match_bloc.dart';
import 'package:racketreel/injection.dart';
import 'package:racketreel/scoring/presentation/view/scoring_page.dart';

class CreateMatchPage extends StatelessWidget {
  const CreateMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateMatchBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Match"),
        ),
        body: BlocBuilder<CreateMatchBloc, CreateMatchState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                // TODO: Create match in backend
                Navigator.push(
                    context,
                    // TODO: Use the created match id
                    MaterialPageRoute(builder: (context) => ScoringPage(matchId: 1))
                );
              },
              child: Text("Create Match"),
            );
          }
        )
      )
    );
  }
}