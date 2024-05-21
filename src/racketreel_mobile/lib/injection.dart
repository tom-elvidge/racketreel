import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  $initGetIt(getIt);

  getIt.registerSingleton<AppConfig>(await AppConfig.forEnvironment("live"), signalsReady: true);
}