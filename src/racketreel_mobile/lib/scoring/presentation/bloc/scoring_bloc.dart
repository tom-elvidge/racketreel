import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'scoring_event.dart';
part 'scoring_state.dart';

@injectable
class ScoringBloc extends Bloc<ScoringEvent, ScoringState> {
  ScoringBloc() : super(ScoringInitial()) {
    on<ScoringEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
