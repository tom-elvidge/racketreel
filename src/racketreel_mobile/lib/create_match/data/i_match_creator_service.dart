import 'package:racketreel/client/matches.pb.dart';

abstract interface class IMatchCreatorService {
  Future<(bool, int)> create(String teamOneName, String teamTwoName, Team servingFirst, Format format);
}