import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racketreel/create_match/presentation/bloc/create_match_cubit.dart';
import 'package:racketreel/create_match/presentation/view/serving_first_field.dart';
import 'package:racketreel/injection.dart';
import 'package:racketreel/scoring/presentation/view/scoring_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'format_field.dart';
import 'name_field.dart';

class CreateMatchPage extends StatefulWidget {
  const CreateMatchPage({super.key});

  @override
  State<CreateMatchPage> createState() => _CreateMatchPageState();
}

class _CreateMatchPageState extends State<CreateMatchPage> {
  final _formKey = GlobalKey<FormState>();

  late CreateMatchFormatCubit _createMatchCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _createMatchCubit = getIt<CreateMatchFormatCubit>(),
      child: BlocListener<CreateMatchFormatCubit, CreateMatchState>(
        listener: (context, state) {
          if (state.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  action: SnackBarAction(
                    label: 'Report',
                    onPressed: () async {
                      await launchUrl(Uri.parse("https://github.com/racketreel/feedback/issues/new"));
                    },
                  ),
                  content: const Text("Failed to create match."),
                ));
          }
        },
        child: BlocBuilder<CreateMatchFormatCubit, CreateMatchState>(
          builder: (context, state)
          {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Create match"),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.check),
                    tooltip: 'Start',
                    onPressed: state.creating ? () {} : () async {
                      var matchId = await context.read<CreateMatchFormatCubit>().submit();

                      // ignore: use_build_context_synchronously
                      if (!context.mounted) return;

                      if (matchId == null) return;

                      // todo: convert cubit to bloc
                      // todo: use bloc listener to do this on created side effect
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScoringPage(matchId: matchId))
                      );
                    },
                  ),
                ],
                bottom: state.creating ? const PreferredSize(
                  preferredSize: Size(double.infinity, 1.0),
                  child: LinearProgressIndicator(),
                ) : null,
              ),
              body: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          NameField(
                            label: "Team one name",
                            onChange: _createMatchCubit.updateTeamOneName,
                          ),
                          NameField(
                            label: "Team two name",
                            onChange: context
                                .read<CreateMatchFormatCubit>()
                                .updateTeamTwoName,
                          ),
                          // todo: bug when changing the name of the selected serving first
                          ServingFirstField(
                            names: [state.teamOneName, state.teamTwoName],
                            onChange: context
                                .read<CreateMatchFormatCubit>()
                                .updateTeamOneServingFirst,
                          ),
                          FormatField(
                            onChange: context
                                .read<CreateMatchFormatCubit>()
                                .updateFormat,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}