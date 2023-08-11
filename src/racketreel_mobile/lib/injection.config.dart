// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'feed/data/static_summary_data_source.dart' as _i4;
import 'feed/data/feed_item_repository.dart' as _i6;
import 'feed/data/i_summary_data_source.dart' as _i3;
import 'feed/domain/i_feed_item_repository.dart' as _i5;
import 'feed/presentation/bloc/feed_bloc.dart'
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
  gh.factory<_i3.ISummaryDataSource>(() => _i4.StaticSummaryDataSource());
  gh.factory<_i5.IFeedItemRepository>(
      () => _i6.FeedItemRepository(dataSource: get<_i3.ISummaryDataSource>()));
  gh.factory<_i7.FeedBloc>(() => _i7.FeedBloc(get<_i5.IFeedItemRepository>()));
  return get;
}
