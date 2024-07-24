import 'package:flutter/material.dart';
import 'package:racketreel/auth/presentation/view/auth_gate.dart';

class RacketReelApp extends StatelessWidget {
  const RacketReelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark()
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthGate(),
      }
    );
  }
}
