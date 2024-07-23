// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app_config.dart' as _i4;
import 'create_match/data/i_match_creator_service.dart' as _i5;
import 'create_match/data/match_creator_service.dart' as _i6;
import 'create_match/presentation/bloc/create_match_cubit.dart' as _i18;
import 'feed/data/feed_item_repository.dart' as _i20;
import 'feed/domain/i_feed_item_repository.dart' as _i19;
import 'feed/presentation/bloc/feed_bloc.dart' as _i24;
import 'match/data/i_state_history_data_source.dart' as _i9;
import 'match/data/match_state_repository.dart' as _i22;
import 'match/data/state_history_data_source.dart' as _i10;
import 'match/data/summary_repository.dart' as _i14;
import 'match/domain/i_match_state_repository.dart' as _i21;
import 'match/domain/i_summary_repository.dart' as _i13;
import 'match/presentation/bloc/match_bloc.dart' as _i23;
import 'profile/bloc/profile_bloc.dart' as _i16;
import 'profile/live_matches_service.dart' as _i3;
import 'profile/user_service.dart' as _i15;
import 'scoring/data/i_scoring_service.dart' as _i7;
import 'scoring/data/scoring_service.dart' as _i8;
import 'scoring/presentation/bloc/scoring_bloc.dart' as _i17;
import 'shared/data/i_summary_data_source.dart' as _i11;
import 'shared/data/summary_data_source.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ILiveMatchesService>(
      () => _i3.LiveMatchesService(config: get<_i4.AppConfig>()));
  gh.factory<_i5.IMatchCreatorService>(
      () => _i6.MatchCreatorService(config: get<_i4.AppConfig>()));
  gh.factory<_i7.IScoringService>(
      () => _i8.ScoringService(config: get<_i4.AppConfig>()));
  gh.factory<_i9.IStateHistoryDataSource>(
      () => _i10.StateHistoryDataSource(config: get<_i4.AppConfig>()));
  gh.factory<_i11.ISummaryDataSource>(
      () => _i12.SummaryDataSource(config: get<_i4.AppConfig>()));
  gh.factory<_i13.ISummaryRepository>(
      () => _i14.SummaryRepository(dataSource: get<_i11.ISummaryDataSource>()));
  gh.factory<_i15.IUserService>(
      () => _i15.UserService(config: get<_i4.AppConfig>()));
  gh.factory<_i16.ProfileBloc>(() => _i16.ProfileBloc(
        get<_i15.IUserService>(),
        get<_i3.ILiveMatchesService>(),
      ));
  gh.factory<_i17.ScoringBloc>(
      () => _i17.ScoringBloc(get<_i7.IScoringService>()));
  gh.factory<_i18.CreateMatchFormatCubit>(
      () => _i18.CreateMatchFormatCubit(get<_i5.IMatchCreatorService>()));
  gh.factory<_i19.IFeedItemRepository>(() => _i20.FeedItemRepository(
        dataSource: get<_i11.ISummaryDataSource>(),
        userService: get<_i15.IUserService>(),
      ));
  gh.factory<_i21.IMatchStateRepository>(() => _i22.MatchStateRepository(
      dataSource: get<_i9.IStateHistoryDataSource>()));
  gh.factory<_i23.MatchBloc>(() => _i23.MatchBloc(
        get<_i21.IMatchStateRepository>(),
        get<_i13.ISummaryRepository>(),
      ));
  gh.factory<_i24.FeedBloc>(
      () => _i24.FeedBloc(get<_i19.IFeedItemRepository>()));
  return get;
}
