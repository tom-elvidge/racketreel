import 'package:racketreel/client/matches.pb.dart';

abstract interface class ISummaryDataSource
{
  List<Summary> getSummaries();
}