import 'package:racketreel/match/domain/summary_entity.dart';

abstract interface class ISummaryRepository {
  Future<SummaryEntity> getSummary(int matchId);
}