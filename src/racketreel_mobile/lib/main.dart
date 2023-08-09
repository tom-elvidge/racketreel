import 'package:flutter/widgets.dart';
import 'package:racketreel/app.dart';
import 'package:racketreel/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const RacketReelApp());
}