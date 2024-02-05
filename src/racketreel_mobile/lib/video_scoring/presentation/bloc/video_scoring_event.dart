part of 'video_scoring_bloc.dart';

@immutable
sealed class VideoScoringEvent {
  const VideoScoringEvent();
}

final class InitialEvent extends VideoScoringEvent {
  const InitialEvent();
}

final class SelectVideoEvent extends VideoScoringEvent {
  const SelectVideoEvent();
}

final class StartScoringEvent extends VideoScoringEvent {
  const StartScoringEvent();
}

final class TogglePlayPauseEvent extends VideoScoringEvent {
  const TogglePlayPauseEvent();
}