import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:racketreel/app.dart';
import 'package:racketreel/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);
  // todo: add config for different environments (local emulator, test and prod)
  FirebaseAuth.instanceFor(app: Firebase.app());

  runApp(const RacketReelApp());
}