// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app_config.dart' as _i5;
import 'feed/data/feed_item_repository.dart' as _i11;
import 'feed/domain/i_feed_item_repository.dart' as _i10;
import 'feed/presentation/bloc/feed_bloc.dart' as _i15;
import 'match/data/i_state_history_data_source.dart' as _i3;
import 'match/data/match_state_repository.dart' as _i13;
import 'match/data/state_history_data_source.dart' as _i4;
import 'match/data/summary_repository.dart' as _i9;
import 'match/domain/i_match_state_repository.dart' as _i12;
import 'match/domain/i_summary_repository.dart' as _i8;
import 'match/presentation/bloc/match_bloc.dart' as _i14;
import 'shared/data/i_summary_data_source.dart' as _i6;
import 'shared/data/summary_data_source.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.IStateHistoryDataSource>(
      () => _i4.StateHistoryDataSource(config: get<_i5.AppConfig>()));
  gh.factory<_i6.ISummaryDataSource>(
      () => _i7.SummaryDataSource(config: get<_i5.AppConfig>()));
  gh.factory<_i8.ISummaryRepository>(
      () => _i9.SummaryRepository(dataSource: get<_i6.ISummaryDataSource>()));
  gh.factory<_i10.IFeedItemRepository>(
      () => _i11.FeedItemRepository(dataSource: get<_i6.ISummaryDataSource>()));
  gh.factory<_i12.IMatchStateRepository>(() => _i13.MatchStateRepository(
      dataSource: get<_i3.IStateHistoryDataSource>()));
  gh.factory<_i14.MatchBloc>(() => _i14.MatchBloc(
        get<_i12.IMatchStateRepository>(),
        get<_i8.ISummaryRepository>(),
      ));
  gh.factory<_i15.FeedBloc>(
      () => _i15.FeedBloc(get<_i10.IFeedItemRepository>()));
  return get;
}
