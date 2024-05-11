// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app_config.dart' as _i5;
import 'create_match/data/i_match_creator_service.dart' as _i3;
import 'create_match/data/match_creator_service.dart' as _i4;
import 'create_match/presentation/bloc/create_match_cubit.dart' as _i17;
import 'feed/data/feed_item_repository.dart' as _i19;
import 'feed/domain/i_feed_item_repository.dart' as _i18;
import 'feed/presentation/bloc/feed_bloc.dart' as _i23;
import 'match/data/i_state_history_data_source.dart' as _i8;
import 'match/data/match_state_repository.dart' as _i21;
import 'match/data/state_history_data_source.dart' as _i9;
import 'match/data/summary_repository.dart' as _i13;
import 'match/domain/i_match_state_repository.dart' as _i20;
import 'match/domain/i_summary_repository.dart' as _i12;
import 'match/presentation/bloc/match_bloc.dart' as _i22;
import 'profile/bloc/profile_bloc.dart' as _i15;
import 'profile/user_service.dart' as _i14;
import 'scoring/data/i_scoring_service.dart' as _i6;
import 'scoring/data/scoring_service.dart' as _i7;
import 'scoring/presentation/bloc/scoring_bloc.dart' as _i16;
import 'shared/data/i_summary_data_source.dart' as _i10;
import 'shared/data/summary_data_source.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.IMatchCreatorService>(
      () => _i4.MatchCreatorService(config: get<_i5.AppConfig>()));
  gh.factory<_i6.IScoringService>(
      () => _i7.ScoringService(config: get<_i5.AppConfig>()));
  gh.factory<_i8.IStateHistoryDataSource>(
      () => _i9.StateHistoryDataSource(config: get<_i5.AppConfig>()));
  gh.factory<_i10.ISummaryDataSource>(
      () => _i11.SummaryDataSource(config: get<_i5.AppConfig>()));
  gh.factory<_i12.ISummaryRepository>(
      () => _i13.SummaryRepository(dataSource: get<_i10.ISummaryDataSource>()));
  gh.factory<_i14.IUserService>(
      () => _i14.UserService(config: get<_i5.AppConfig>()));
  gh.factory<_i15.ProfileBloc>(
      () => _i15.ProfileBloc(get<_i14.IUserService>()));
  gh.factory<_i16.ScoringBloc>(
      () => _i16.ScoringBloc(get<_i6.IScoringService>()));
  gh.factory<_i17.CreateMatchFormatCubit>(
      () => _i17.CreateMatchFormatCubit(get<_i3.IMatchCreatorService>()));
  gh.factory<_i18.IFeedItemRepository>(() => _i19.FeedItemRepository(
        dataSource: get<_i10.ISummaryDataSource>(),
        userService: get<_i14.IUserService>(),
      ));
  gh.factory<_i20.IMatchStateRepository>(() => _i21.MatchStateRepository(
      dataSource: get<_i8.IStateHistoryDataSource>()));
  gh.factory<_i22.MatchBloc>(() => _i22.MatchBloc(
        get<_i20.IMatchStateRepository>(),
        get<_i12.ISummaryRepository>(),
      ));
  gh.factory<_i23.FeedBloc>(
      () => _i23.FeedBloc(get<_i18.IFeedItemRepository>()));
  return get;
}
