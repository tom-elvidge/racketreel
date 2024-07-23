part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class Initialize extends ProfileEvent {
  const Initialize({required this.userId});

  final String? userId;

  @override
  List<Object> get props => [userId ?? ""];
}

final class Refresh extends ProfileEvent {}

final class SignOut extends ProfileEvent {}

final class UpdateDisplayName extends ProfileEvent {
  const UpdateDisplayName({required this.displayName});

  final String displayName;

  @override
  List<Object> get props => [displayName];
}

final class UpdateAvatar extends ProfileEvent {
  const UpdateAvatar({required this.avatar});

  final Uri avatar;

  @override
  List<Object> get props => [avatar];
}

final class FetchFollowers extends ProfileEvent {}

final class FetchFollowing extends ProfileEvent {}

final class Follow extends ProfileEvent {}

final class Unfollow extends ProfileEvent {}

final class LiveMatchesFetchOlderEvent extends ProfileEvent {
  const LiveMatchesFetchOlderEvent();
}