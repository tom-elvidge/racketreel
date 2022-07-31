import 'package:racket_reel_mobile/matches/matches_service.dart';
import 'package:racket_reel_mobile/matches/matches_service_dummy.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<MatchesService>(() => MatchesServiceDummy());
}
