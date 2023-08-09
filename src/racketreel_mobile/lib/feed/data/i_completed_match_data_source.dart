import 'package:racketreel/feed/data/completed_match_dto.dart';

abstract interface class ICompletedMatchDataSource
{
  List<CompletedMatchDto> getMatches();
}