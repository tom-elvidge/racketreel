part of 'create_match_cubit.dart';

@immutable
abstract class CreateMatchState {
  final String teamOneName;
  final String teamTwoName;
  final bool teamOneServingFirst;
  final MatchFormat format;

  final bool created;
  final bool creating;

  const CreateMatchState({
    this.teamOneName = '',
    this.teamTwoName = '',
    this.teamOneServingFirst = false,
    this.format = MatchFormat.None,
    this.created = false,
    this.creating = false,
  }) : super();

  CreateMatchState copyWith({
    String? teamOneName,
    String? teamTwoName,
    bool? teamOneServingFirst,
    MatchFormat? format,
    bool? created,
    bool? creating,
  });
}

class CreateMatchUpdate extends CreateMatchState {
  const CreateMatchUpdate({
    String teamOneName = '',
    String teamTwoName = '',
    bool teamOneServingFirst = false,
    MatchFormat format = MatchFormat.None,
    bool created = false,
    bool creating = false,
  }) : super(
    teamOneName: teamOneName,
    teamTwoName: teamTwoName,
    teamOneServingFirst: teamOneServingFirst,
    format: format,
    created: created,
    creating: creating,
  );

  @override
  CreateMatchUpdate copyWith({
    String? teamOneName,
    String? teamTwoName,
    bool? teamOneServingFirst,
    MatchFormat? format,
    bool? created,
    bool? creating,
  }) {
    return CreateMatchUpdate(
      teamOneName: teamOneName ?? this.teamOneName,
      teamTwoName: teamTwoName ?? this.teamTwoName,
      teamOneServingFirst: teamOneServingFirst ?? this.teamOneServingFirst,
      format: format ?? this.format,
      created: created ?? this.created,
      creating: creating ?? this.creating,
    );
  }
}