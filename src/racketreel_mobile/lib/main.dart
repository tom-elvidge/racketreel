import 'package:flutter/widgets.dart';
import 'package:racketreel/app.dart';
import 'package:racketreel/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const RacketReelApp());
}