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
import 'create_match/presentation/bloc/create_match_cubit.dart' as _i19;
import 'feed/data/feed_item_repository.dart' as _i21;
import 'feed/domain/i_feed_item_repository.dart' as _i20;
import 'feed/presentation/bloc/feed_bloc.dart' as _i25;
import 'match/data/i_state_history_data_source.dart' as _i10;
import 'match/data/match_state_repository.dart' as _i23;
import 'match/data/state_history_data_source.dart' as _i11;
import 'match/data/summary_repository.dart' as _i15;
import 'match/domain/i_match_state_repository.dart' as _i22;
import 'match/domain/i_summary_repository.dart' as _i14;
import 'match/presentation/bloc/match_bloc.dart' as _i24;
import 'profile/bloc/profile_bloc.dart' as _i17;
import 'profile/live_matches_service.dart' as _i3;
import 'profile/user_service.dart' as _i16;
import 'scoring/data/i_scoring_service.dart' as _i8;
import 'scoring/data/scoring_service.dart' as _i9;
import 'scoring/presentation/bloc/scoring_bloc.dart' as _i18;
import 'shared/data/i_summary_data_source.dart' as _i12;
import 'shared/data/match_service.dart' as _i7;
import 'shared/data/summary_data_source.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i7.IMatchService>(
      () => _i7.MatchService(config: get<_i4.AppConfig>()));
  gh.factory<_i8.IScoringService>(
      () => _i9.ScoringService(config: get<_i4.AppConfig>()));
  gh.factory<_i10.IStateHistoryDataSource>(
      () => _i11.StateHistoryDataSource(config: get<_i4.AppConfig>()));
  gh.factory<_i12.ISummaryDataSource>(
      () => _i13.SummaryDataSource(config: get<_i4.AppConfig>()));
  gh.factory<_i14.ISummaryRepository>(
      () => _i15.SummaryRepository(dataSource: get<_i12.ISummaryDataSource>()));
  gh.factory<_i16.IUserService>(
      () => _i16.UserService(config: get<_i4.AppConfig>()));
  gh.factory<_i17.ProfileBloc>(() => _i17.ProfileBloc(
        get<_i16.IUserService>(),
        get<_i3.ILiveMatchesService>(),
      ));
  gh.factory<_i18.ScoringBloc>(() => _i18.ScoringBloc(
        get<_i8.IScoringService>(),
        get<_i7.IMatchService>(),
      ));
  gh.factory<_i19.CreateMatchFormatCubit>(
      () => _i19.CreateMatchFormatCubit(get<_i5.IMatchCreatorService>()));
  gh.factory<_i20.IFeedItemRepository>(() => _i21.FeedItemRepository(
        dataSource: get<_i12.ISummaryDataSource>(),
        userService: get<_i16.IUserService>(),
      ));
  gh.factory<_i22.IMatchStateRepository>(() => _i23.MatchStateRepository(
      dataSource: get<_i10.IStateHistoryDataSource>()));
  gh.factory<_i24.MatchBloc>(() => _i24.MatchBloc(
        get<_i22.IMatchStateRepository>(),
        get<_i14.ISummaryRepository>(),
        get<_i7.IMatchService>(),
      ));
  gh.factory<_i25.FeedBloc>(
      () => _i25.FeedBloc(get<_i20.IFeedItemRepository>()));
  return get;
}
