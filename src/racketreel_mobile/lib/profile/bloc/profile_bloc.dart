import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:racketreel/profile/live_matches_service.dart';
import 'package:racketreel/profile/user_service.dart';
import 'package:stream_transform/stream_transform.dart';

part 'profile_event.dart';
part 'profile_state.dart';

const throttleDuration = Duration(milliseconds: 1000);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IUserService users;
  final ILiveMatchesService liveMatches;
  final logger = Logger((ProfileBloc).toString());

  ProfileBloc(this.users, this.liveMatches) : super(ProfileState(isInitializing: true)) {
    on<Initialize>(_onInitialize);
    on<Refresh>(_onRefresh);
    on<SignOut>(_onSignOut);
    on<UpdateDisplayName>(_onUpdateDisplayName);
    on<UpdateAvatar>(_onUpdateAvatar);
    on<FetchFollowers>(_onFetchFollowers);
    on<FetchFollowing>(_onFetchFollowing);
    on<Follow>(_onFollow);
    on<Unfollow>(_onUnfollow);
    on<LiveMatchesFetchOlderEvent>(
        _onLiveMatchesFetchOlderEvent,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<ProfileState> emit,
  ) async {
    var currentUserId = FirebaseAuth.instance.currentUser?.uid;

    if (currentUserId == null) {
      return;
    }

    if (event.userId == null) {
      return;
    }

    var liveMatchesItems = await liveMatches.getLiveMatches(1, event.userId!);

    var userInfo = await users.getUserInfo(event.userId!);

    var userIsCurrentUser = currentUserId == event.userId;

    if (userInfo == null) {
      emit(
          state.copyWith(
            isInitializing: false,
            isUserFound: false,
            userIsCurrentUser: userIsCurrentUser,
            liveMatchesLastPageFetched: 1,
            liveMatchesItems: liveMatchesItems
          )
      );
      return;
    }

    emit(
        state.copyWith(
          isInitializing: false,
          isUserFound: true,
          userId: event.userId,
          displayName: userInfo.displayName,
          avatar: userInfo.avatar,
          userIsCurrentUser: userIsCurrentUser,
          userFollowsCurrentUser: userIsCurrentUser ? null : await users.isUserFollower(currentUserId, event.userId!),
          currentUserFollowsUser: userIsCurrentUser ? null : await users.isUserFollower(event.userId!, currentUserId),
          liveMatchesLastPageFetched: 1,
          liveMatchesItems: liveMatchesItems
        )
    );
  }

  Future<void> _onRefresh(
      Refresh event,
      Emitter<ProfileState> emit,
      ) async {
    var currentUserId = FirebaseAuth.instance.currentUser?.uid;

    if (currentUserId == null) {
      return;
    }

    if (state.userId == null) {
      return;
    }

    emit(state.copyWith(
      isInitializing: true,
      liveMatchesLastPageFetched: -1,
      liveMatchesItems: [],
      liveMatchesEndOfFeed: false
    ));

    var liveMatchesItems = await liveMatches.getLiveMatches(1, state.userId!);

    var userInfo = await users.getUserInfo(state.userId!);

    var userIsCurrentUser = currentUserId == state.userId;

    if (userInfo == null) {
      emit(
          state.copyWith(
              isInitializing: false,
              isUserFound: false,
              displayName: userInfo!.displayName,
              userIsCurrentUser: userIsCurrentUser,
              liveMatchesLastPageFetched: 1,
              liveMatchesItems: liveMatchesItems,
              liveMatchesEndOfFeed: false,
          )
      );
      return;
    }

    emit(
        state.copyWith(
            isInitializing: false,
            isUserFound: true,
            displayName: userInfo.displayName,
            avatar: userInfo.avatar,
            userIsCurrentUser: userIsCurrentUser,
            userFollowsCurrentUser: userIsCurrentUser ? null : await users.isUserFollower(currentUserId, state.userId!),
            currentUserFollowsUser: userIsCurrentUser ? null : await users.isUserFollower(state.userId!, currentUserId),
            liveMatchesLastPageFetched: 1,
            liveMatchesItems: liveMatchesItems,
            liveMatchesEndOfFeed: false,
        )
    );
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<ProfileState> emit,
  ) async {
    await FirebaseAuth.instance.signOut();

    emit(ProfileState());
  }

  Future<void> _onUpdateDisplayName(
    UpdateDisplayName event,
    Emitter<ProfileState> emit,
  ) async {
    var success = await users.updateUserInfo(displayName: event.displayName);

    if (success) {
      emit(
        state.copyWith(
            displayName: event.displayName
        )
      );
    }
  }

  Future<void> _onUpdateAvatar(
    UpdateAvatar event,
    Emitter<ProfileState> emit,
  ) async {
    // todo: upload image to bucket

    var success = await users.updateUserInfo(avatar: event.avatar);

    if (success) {
      emit(
        state.copyWith(
          avatar: event.avatar
        )
      );
    }
  }

  Future<void> _onFetchFollowers(
    FetchFollowers event,
    Emitter<ProfileState> emit,
  ) async {
    if (state.userId == null || !state.isUserFound) {
      return;
    }

    var followers = await users.getFollowers(state.userId!);

    if (followers == null) {
      return;
    }

    emit(
      state.copyWith(
        followers: followers.map((x) => new FollowerUser(
          x.userId,
          x.displayName,
          x.avatar,
        )).toList()
      ));
  }

  Future<void> _onFetchFollowing(
    FetchFollowing event,
    Emitter<ProfileState> emit,
  ) async {
    if (state.userId == null || !state.isUserFound) {
      return;
    }

    var following = await users.getFollowing(state.userId!);

    if (following == null) {
      return;
    }

    emit(
      state.copyWith(
        following: following.map((x) => new FollowedUser(
          x.userId,
          x.displayName,
          x.avatar,
        )).toList()
      ));
  }

  Future<void> _onFollow(
    Follow event,
    Emitter<ProfileState> emit,
  ) async {
    if (state.userId == null || !state.isUserFound) {
      return;
    }

    var success = await users.followUser(state.userId!);

    if (success) {
      emit(
        state.copyWith(
          currentUserFollowsUser: true
        )
      );
    }
  }

  Future<void> _onUnfollow(
    Unfollow event,
    Emitter<ProfileState> emit,
  ) async {
    if (state.userId == null || !state.isUserFound) {
      return;
    }

    var success = await users.unfollowUser(state.userId!);

    if (success) {
      emit(
        state.copyWith(
          currentUserFollowsUser: false
        )
      );
    }
  }

  Future<void> _onLiveMatchesFetchOlderEvent(
      LiveMatchesFetchOlderEvent event,
      Emitter<ProfileState> emit,
    ) async {
    // do not fetch the next page if we are already at the end of the feed
    // do not fetch the next page if we are already fetching it
    // do not fetch if we don't know the user id
    if (state.liveMatchesEndOfFeed || state.liveMatchesFetchingOlder || state.userId == null) {
      return;
    }

    emit(state.copyWith(
      liveMatchesFetchingOlder: true,
    ));

    var nextPage = state.liveMatchesLastPageFetched + 1;
    var nextPageItems = await liveMatches.getLiveMatches(nextPage, state.userId!);

    emit(state.copyWith(
      liveMatchesFetchingOlder: false,
      liveMatchesEndOfFeed: nextPageItems.isEmpty,
      liveMatchesLastPageFetched: nextPage,
      liveMatchesItems: List<LiveMatchEntity>.from(state.liveMatchesItems)..addAll(nextPageItems),
    ));
  }
}
