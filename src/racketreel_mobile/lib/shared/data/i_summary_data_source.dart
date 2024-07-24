import 'package:racketreel/client/matches.pb.dart';

abstract interface class ISummaryDataSource
{
  Future<List<Summary>> getSummaries(int pageNumber);
  Future<Summary> getSummary(int matchId);
  Future<List<SummaryV2>> getSummariesV2(int pageNumber);
  Future<SummaryV2> getSummaryV2(int matchId);

}