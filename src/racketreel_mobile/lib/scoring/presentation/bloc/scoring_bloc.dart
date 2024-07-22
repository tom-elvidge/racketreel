import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logging/logging.dart';
import 'package:racketreel/scoring/data/i_scoring_service.dart';
import 'package:racketreel/shared/domain/match_state_entity.dart';
import 'package:racketreel/shared/domain/team.dart';

part 'scoring_event.dart';
part 'scoring_state.dart';

@injectable
class ScoringBloc extends Bloc<ScoringEvent, ScoringState> {
  final IScoringService scoring;
  final logger = Logger((ScoringBloc).toString());
  
  static const methodChannel = MethodChannel('com.racketreel.app/scoring_mc');
  static const eventChannel = EventChannel('com.racketreel.app/scoring_ec');

  ScoringBloc(this.scoring) : super(ScoringUpdate.initial()) {
    on<InitialScoringEvent>(_onInitialScoringEvent);
    on<PointToTeamOneEvent>(_onPointToTeamOneEvent);
    on<PointToTeamTwoEvent>(_onPointToTeamTwoEvent);
    on<UndoEvent>(_onUndoEvent);
    on<ToggleHighlightEvent>(_onToggleHighlightEvent);

    eventChannel.receiveBroadcastStream().listen(_scoringEventChannelHandler);
  }

  void _scoringEventChannelHandler(dynamic userInfoDynamic) async {
    var userInfo = convertUserInfo(userInfoDynamic);
    var method = userInfo["Method"];

    if (method == "POINT_TO_TEAM_ONE") {
      add(const PointToTeamOneEvent());
    } else if (method == "POINT_TO_TEAM_TWO") {
      add(const PointToTeamTwoEvent());
    } else if (method == "UNDO") {
      add(const UndoEvent());
    } else if (method == "TOGGLE_HIGHLIGHT") {
      add(const ToggleHighlightEvent());
    } else if (method == "REFRESH_STATE" && state.matchState != null) {
      var result = await methodChannel.invokeMethod("UPDATE_STATE", _createMatchStateMap(state.matchState!, state.matchId!, state.isLastStateHighlighted));

      if (result["Success"] != "true") {
        print(result["Error"]);
      }
    }
  }

  void _onInitialScoringEvent(InitialScoringEvent event, Emitter<ScoringState> emit) async {
    emit(ScoringUpdate.initial());

    var matchState = await scoring.getState(event.matchId);

    if (matchState == null)
    {
      logger.info("Could not get the state from scoring");
      return;
    }

    var result = await methodChannel.invokeMethod("UPDATE_STATE", _createMatchStateMap(matchState, event.matchId, false));

    if (result["Success"] != "true") {
      print(result["Error"]);
    }

    emit(state.copyWith(
      matchId: event.matchId,
      matchState: matchState,
      isInitializing: false,
      isUpdating: false
    ));
  }

  void _onPointToTeamOneEvent(PointToTeamOneEvent event, Emitter<ScoringState> emit) => _onPoint(Team.teamOne, emit);

  void _onPointToTeamTwoEvent(PointToTeamTwoEvent event, Emitter<ScoringState> emit) => _onPoint(Team.teamTwo, emit);

  void _onPoint(Team team, Emitter<ScoringState> emit) async {
    if (state.matchId == null)
    {
      logger.info("Cannot add a point since the state does not contain a match id");
      return;
    }

    emit(state.copyWith(
      isUpdating: true
    ));

    try {
      await scoring.addPoint(state.matchId!, team);

      var matchState = await scoring.getState(state.matchId!);

      var result = await methodChannel.invokeMethod("UPDATE_STATE", _createMatchStateMap(matchState!, state.matchId!, false));

      if (result["Success"] != "true") {
        print(result["Error"]);
      }

      emit(state.copyWith(
        isUpdating: false,
        matchState: matchState,
        isLastStateHighlighted: false
      ));
    } catch (e) {
      logger.warning("Unexpected exception updating match state", e);
    }
  }

  void _onUndoEvent(UndoEvent event, Emitter<ScoringState> emit) async {
    if (state.matchId == null)
    {
      logger.info("Cannot undo since the state does not contain a match id");
      return;
    }

    emit(state.copyWith(
      isUpdating: true
    ));

    try {
      await scoring.undoPoint(state.matchId!);

      var matchState = await scoring.getState(state.matchId!);

      var lastMatchState = await scoring.getStateAtVersion(state.matchId!, matchState!.version - 1);

      var result = await methodChannel.invokeMethod("UPDATE_STATE", _createMatchStateMap(matchState, state.matchId!, lastMatchState!.highlighted));

      if (result["Success"] != "true") {
        print(result["Error"]);
      }

      emit(state.copyWith(
        isUpdating: false,
        matchState: matchState,
        isLastStateHighlighted: lastMatchState!.highlighted
      ));
    } catch (e) {
      logger.warning("Unexpected exception undoing match state", e);
    }
  }

  void _onToggleHighlightEvent(ToggleHighlightEvent event, Emitter<ScoringState> emit) async {
    if (state.matchId == null)
    {
      logger.info("Cannot undo since the state does not contain a match id");
      return;
    }

    var version = state.matchState?.version;

    if (version == null || version <= 1) {
      return;
    }

    if (await scoring.toggleHighlight(state.matchId!, version - 1))
    {
      var result = await methodChannel.invokeMethod("UPDATE_STATE", _createMatchStateMap(state.matchState!, state.matchId!, !state.isLastStateHighlighted));

      if (result["Success"] != "true") {
        print(result["Error"]);
      }

      emit(state.copyWith(
        isLastStateHighlighted: !state.isLastStateHighlighted
      ));
    }
  }

  Map<String, String> _createMatchStateMap(
      MatchStateEntity matchState,
      int matchId,
      bool lastStateHighlighted) =>
      {
        "matchId": matchId.toString(),
        "teamOnePoints": matchState.teamOnePoints,
        "teamTwoPoints": matchState.teamTwoPoints,
        "teamOneGames": matchState.teamOneGames,
        "teamTwoGames": matchState.teamTwoGames,
        "teamOneSets": matchState.teamOneSets,
        "teamTwoSets": matchState.teamTwoSets,
        "teamOneName": matchState.teamOneName,
        "teamTwoName": matchState.teamTwoName,
        "serving": matchState.servingTeam == Team.teamOne ? "1" : "2",
        "lastStateHighlighted": lastStateHighlighted ? "true" : "false"
      };

  Map<String, String> convertUserInfo(dynamic dynamicObject) {
    if (dynamicObject is Map) {
      return dynamicObject.map((key, value) => MapEntry(key.toString(), value.toString()));
    }
    throw ArgumentError('Provided dynamic object is not a Map');
  }
}
