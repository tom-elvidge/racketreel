import 'package:injectable/injectable.dart';
import 'package:racketreel/match/domain/i_summary_repository.dart';
import 'package:racketreel/match/domain/summary_entity.dart';
import 'package:racketreel/shared/data/i_summary_data_source.dart';
import 'package:racketreel/shared/data/repository_utils.dart';

@Injectable(as: ISummaryRepository)
class SummaryRepository implements ISummaryRepository {
  late ISummaryDataSource _dataSource;

  SummaryRepository({
    required ISummaryDataSource dataSource,
  }) {
    _dataSource = dataSource;
  }

  @override
  Future<SummaryEntity> getSummary(int matchId) async {
    var response = await _dataSource.getSummary(matchId);
    return SummaryEntity(
        RepositoryUtils.getDateTimeString(response.startedAtUtc.toDateTime()));
  }
}