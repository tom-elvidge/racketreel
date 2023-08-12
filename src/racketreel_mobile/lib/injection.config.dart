// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app_config.dart' as _i5;
import 'feed/data/feed_item_repository.dart' as _i7;
import 'feed/data/i_summary_data_source.dart' as _i3;
import 'feed/data/summary_data_source.dart' as _i4;
import 'feed/domain/i_feed_item_repository.dart' as _i6;
import 'feed/presentation/bloc/feed_bloc.dart'
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
  gh.factory<_i3.ISummaryDataSource>(
      () => _i4.SummaryDataSource(config: get<_i5.AppConfig>()));
  gh.factory<_i6.IFeedItemRepository>(
      () => _i7.FeedItemRepository(dataSource: get<_i3.ISummaryDataSource>()));
  gh.factory<_i8.FeedBloc>(() => _i8.FeedBloc(get<_i6.IFeedItemRepository>()));
  return get;
}
