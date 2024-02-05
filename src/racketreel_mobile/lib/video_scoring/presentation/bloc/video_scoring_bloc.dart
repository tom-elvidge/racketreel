import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:video_player/video_player.dart';

part 'video_scoring_event.dart';
part 'video_scoring_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class VideoScoringBloc extends Bloc<VideoScoringEvent, VideoScoringState> {

  VideoScoringBloc() : super(VideoScoringStateUpdate.initial()) {
    on<InitialEvent>(_initial, transformer: throttleDroppable(throttleDuration));

    on<SelectVideoEvent>(_selectVideo);

    on<StartScoringEvent>(_startScoring);
  }

  void _initial(InitialEvent event, Emitter<VideoScoringState> emit) async {
    emit(VideoScoringStateUpdate.initial());
  }

  void _selectVideo(SelectVideoEvent event, Emitter<VideoScoringState> emit) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result == null) return;

    var path = result.files.single.path;

    if (path == null) return;

    emit(state.copyWith(videoFilePath: path));
  }

  void _startScoring(StartScoringEvent event, Emitter<VideoScoringState> emit) async {
    if (state.videoFilePath == null) return;

    final controller = VideoPlayerController
        .file(new File(state.videoFilePath!));

    await controller.initialize();

    emit(state.copyWith(controller: controller));
  }
}