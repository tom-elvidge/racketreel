import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:racketreel/create_match/data/i_match_creator_service.dart';
import 'package:racketreel/shared/domain/match_format.dart';

import '../../../client/matches.pbenum.dart';

part 'create_match_state.dart';

@injectable
class CreateMatchFormatCubit extends Cubit<CreateMatchState> {
  final IMatchCreatorService creator;

  CreateMatchFormatCubit(this.creator) : super(CreateMatchUpdate());

  void initForm({
    String teamOneName = '',
    String teamTwoName = '',
    bool teamOneServingFirst = false,
    MatchFormat format = MatchFormat.None,
    bool created = false,
    bool creating = false,
  }) {
    emit(state.copyWith(
      teamOneName: teamOneName,
      teamTwoName: teamTwoName,
      teamOneServingFirst: teamOneServingFirst,
      format: format,
      created: created,
      creating: creating
    ));
  }

  void updateTeamOneName(String? teamOneName) {
    emit(state.copyWith(teamOneName: teamOneName));
  }

  void updateTeamTwoName(String? teamTwoName) {
    emit(state.copyWith(teamTwoName: teamTwoName));
  }

  void updateTeamOneServingFirst(bool? teamOneServingFirst) {
    emit(state.copyWith(teamOneServingFirst: teamOneServingFirst));
  }

  void updateFormat(MatchFormat? format) {
    emit(state.copyWith(format: format));
  }

  void reset() {
    emit(const CreateMatchUpdate());
  }

  Future<int?> submit() async {
    emit(const CreateMatchUpdate(creating: true));

    var servingFirst = state.teamOneServingFirst ? Team.TEAM_ONE : Team.TEAM_TWO;

    var format;
    switch (state.format) {
      case MatchFormat.None:
        format = Format.BEST_OF_THREE;
        break;
      default:
        format = Format.TIEBREAK_TO_TEN;
        break;
    }

    var (success, matchId) = await creator.create(
        state.teamOneName,
        state.teamTwoName,
        servingFirst,
        format);

    if (!success) {
      emit(const CreateMatchUpdate(creating: false, created: false));
      return null;
    }

    emit(const CreateMatchUpdate(creating: false, created: true));
    return matchId;
  }
}
