import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:racketreel/shared/domain/match_state_entity.dart';

part 'scoring_event.dart';
part 'scoring_state.dart';

@injectable
class ScoringBloc extends Bloc<ScoringEvent, ScoringState> {
  ScoringBloc() : super(const ScoringInitial()) {
    on<InitialScoringEvent>(_onInitialScoringEvent);
    on<PointToTeamOneEvent>(_onPointToTeamOneEvent);
    on<PointToTeamTwoEvent>(_onPointToTeamTwoEvent);
    on<UndoEvent>(_onUndoEvent);
    on<ToggleHighlightEvent>(_onToggleHighlightEvent);
  }

  void _onInitialScoringEvent(InitialScoringEvent event, Emitter<ScoringState> emit) async {
    emit(const ScoringInitial());

    // todo: get initial state from scoring service
  }

  void _onPointToTeamOneEvent(PointToTeamOneEvent event, Emitter<ScoringState> emit) async {
  }

  void _onPointToTeamTwoEvent(PointToTeamTwoEvent event, Emitter<ScoringState> emit) async {
  }

  void _onUndoEvent(UndoEvent event, Emitter<ScoringState> emit) async {
  }

  void _onToggleHighlightEvent(ToggleHighlightEvent event, Emitter<ScoringState> emit) async {
  }
}
