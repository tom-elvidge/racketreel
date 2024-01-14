import 'package:bloc/bloc.dart';
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

  ScoringBloc(this.scoring) : super(ScoringUpdate.initial()) {
    on<InitialScoringEvent>(_onInitialScoringEvent);
    on<PointToTeamOneEvent>(_onPointToTeamOneEvent);
    on<PointToTeamTwoEvent>(_onPointToTeamTwoEvent);
    on<UndoEvent>(_onUndoEvent);
    on<ToggleHighlightEvent>(_onToggleHighlightEvent);
  }

  void _onInitialScoringEvent(InitialScoringEvent event, Emitter<ScoringState> emit) async {
    emit(ScoringUpdate.initial());

    var matchState = await scoring.getState(event.matchId);

    if (matchState == null)
    {
      logger.info("Could not get the state from scoring");
      return;
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
      emit(state.copyWith(
        isLastStateHighlighted: !state.isLastStateHighlighted
      ));
    }
  }
}
