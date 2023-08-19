import 'package:racketreel/client/matches.pb.dart';

abstract interface class ISummaryDataSource
{
  Future<List<Summary>> getSummaries(int pageNumber);
}