import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  $initGetIt(getIt);

  const env = String.fromEnvironment("ENV", defaultValue: "dev");
  getIt.registerSingleton<AppConfig>(await AppConfig.forEnvironment(env), signalsReady: true);
}