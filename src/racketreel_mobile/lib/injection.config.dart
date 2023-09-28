// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app_config.dart' as _i6;
import 'create_match/presentation/bloc/create_match_bloc.dart' as _i3;
import 'feed/data/feed_item_repository.dart' as _i13;
import 'feed/domain/i_feed_item_repository.dart' as _i12;
import 'feed/presentation/bloc/feed_bloc.dart' as _i17;
import 'match/data/i_state_history_data_source.dart' as _i4;
import 'match/data/match_state_repository.dart' as _i15;
import 'match/data/state_history_data_source.dart' as _i5;
import 'match/data/summary_repository.dart' as _i10;
import 'match/domain/i_match_state_repository.dart' as _i14;
import 'match/domain/i_summary_repository.dart' as _i9;
import 'match/presentation/bloc/match_bloc.dart' as _i16;
import 'scoring/presentation/bloc/scoring_bloc.dart' as _i11;
import 'shared/data/i_summary_data_source.dart' as _i7;
import 'shared/data/summary_data_source.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.CreateMatchBloc>(() => _i3.CreateMatchBloc());
  gh.factory<_i4.IStateHistoryDataSource>(
      () => _i5.StateHistoryDataSource(config: get<_i6.AppConfig>()));
  gh.factory<_i7.ISummaryDataSource>(
      () => _i8.SummaryDataSource(config: get<_i6.AppConfig>()));
  gh.factory<_i9.ISummaryRepository>(
      () => _i10.SummaryRepository(dataSource: get<_i7.ISummaryDataSource>()));
  gh.factory<_i11.ScoringBloc>(() => _i11.ScoringBloc());
  gh.factory<_i12.IFeedItemRepository>(
      () => _i13.FeedItemRepository(dataSource: get<_i7.ISummaryDataSource>()));
  gh.factory<_i14.IMatchStateRepository>(() => _i15.MatchStateRepository(
      dataSource: get<_i4.IStateHistoryDataSource>()));
  gh.factory<_i16.MatchBloc>(() => _i16.MatchBloc(
        get<_i14.IMatchStateRepository>(),
        get<_i9.ISummaryRepository>(),
      ));
  gh.factory<_i17.FeedBloc>(
      () => _i17.FeedBloc(get<_i12.IFeedItemRepository>()));
  return get;
}
