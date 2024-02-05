part of 'video_scoring_bloc.dart';

@immutable
abstract class VideoScoringState {
  final String? videoFilePath;
  final VideoPlayerController? controller;
  final bool isLoading;
  final String? errorMessage;

  const VideoScoringState({
    this.videoFilePath,
    this.controller,
    this.isLoading = false,
    this.errorMessage,
  }) : super();

  VideoScoringState copyWith({
    String? videoFilePath,
    VideoPlayerController? controller,
    bool isLoading,
    String? errorMessage,
  });
}

class VideoScoringStateUpdate extends VideoScoringState {
  const VideoScoringStateUpdate({
    String? videoFilePath,
    VideoPlayerController? controller,
    bool isLoading = false,
    String? errorMessage,
  }) : super(
    videoFilePath: videoFilePath,
    controller: controller,
    isLoading: isLoading,
    errorMessage: errorMessage,
  );

  @override
  VideoScoringStateUpdate copyWith({
    String? videoFilePath,
    VideoPlayerController? controller,
    bool? isLoading,
    String? errorMessage,
  }) {
    return VideoScoringStateUpdate(
        videoFilePath: videoFilePath ?? this.videoFilePath,
        controller: controller ?? this.controller,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }

  static VideoScoringStateUpdate initial()
  {
    return const VideoScoringStateUpdate(
      videoFilePath: null,
      controller: null,
      isLoading: false,
      errorMessage: null
    );
  }
}