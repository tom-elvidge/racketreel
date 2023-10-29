import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/create_match/presentation/bloc/create_match_cubit.dart';
import 'package:racketreel/injection.dart';
import 'package:racketreel/scoring/presentation/view/scoring_page.dart';

class CreateMatchPage extends StatelessWidget {
  const CreateMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateMatchFormatCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Match"),
        ),
        body: BlocBuilder<CreateMatchFormatCubit, CreateMatchState>(
          builder: (context, state) {
            // form fields for team names, serving first, format
            // form field validation messages, see: https://medium.com/@azharbinanwar/flutter-form-validation-with-bloc-b46a1ced63c2
            // create button, disabled if creating or created
            // show spinner while creating
            return ElevatedButton(
              onPressed: () async {
                var matchId = await context.read<CreateMatchFormatCubit>().submit();
                if (matchId == null) return;

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScoringPage(matchId: matchId))
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