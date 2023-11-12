part of 'create_match_cubit.dart';

@immutable
abstract class CreateMatchState {
  final String teamOneName;
  final String teamTwoName;
  final bool teamOneServingFirst;
  final MatchFormat format;
  final bool failed;
  final bool creating;

  const CreateMatchState({
    this.teamOneName = '',
    this.teamTwoName = '',
    this.teamOneServingFirst = false,
    this.format = MatchFormat.bestOfThree,
    this.failed = false,
    this.creating = false,
  }) : super();

  CreateMatchState copyWith({
    String? teamOneName,
    String? teamTwoName,
    bool? teamOneServingFirst,
    MatchFormat? format,
    bool? failed,
    bool? creating,
  });
}

class CreateMatchUpdate extends CreateMatchState {
  const CreateMatchUpdate({
    String teamOneName = '',
    String teamTwoName = '',
    bool teamOneServingFirst = false,
    MatchFormat format = MatchFormat.bestOfThree,
    bool failed = false,
    bool creating = false,
  }) : super(
    teamOneName: teamOneName,
    teamTwoName: teamTwoName,
    teamOneServingFirst: teamOneServingFirst,
    format: format,
    failed: failed,
    creating: creating,
  );

  @override
  CreateMatchUpdate copyWith({
    String? teamOneName,
    String? teamTwoName,
    bool? teamOneServingFirst,
    MatchFormat? format,
    bool? failed,
    bool? creating,
  }) {
    return CreateMatchUpdate(
      teamOneName: teamOneName ?? this.teamOneName,
      teamTwoName: teamTwoName ?? this.teamTwoName,
      teamOneServingFirst: teamOneServingFirst ?? this.teamOneServingFirst,
      format: format ?? this.format,
      failed: failed ?? this.failed,
      creating: creating ?? this.creating,
    );
  }
}