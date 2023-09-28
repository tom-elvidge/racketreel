import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'create_match_event.dart';
part 'create_match_state.dart';

@injectable
class CreateMatchBloc extends Bloc<CreateMatchEvent, CreateMatchState> {
  CreateMatchBloc() : super(CreateMatchInitial()) {
    on<CreateMatchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
