import 'package:injectable/injectable.dart';
import 'package:racketreel/feed/data/i_completed_match_data_source.dart';
import 'package:racketreel/feed/data/completed_match_dto.dart';

// todo: move injected match data source to real deal
@Injectable(as: ICompletedMatchDataSource)
class DummyCompletedMatchDataSource implements ICompletedMatchDataSource
{
  @override
  List<CompletedMatchDto> getMatches() {
    return <CompletedMatchDto>[
      CompletedMatchDto("123", "Player One", "Player Two", "2022-05-22 11:54", "6-0, 6-6 (12-10)", "Best of three sets"),
      CompletedMatchDto("124", "Player One", "Player Two", "2022-05-27 09:10", "6-4, 7-5, 6-0", "Best of five sets"),
    ];
  }
}