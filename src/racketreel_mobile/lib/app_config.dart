import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  final String grpcHost;
  final int grpcPort;

  AppConfig({required this.grpcHost, required this.grpcPort});

  static Future<AppConfig> forEnvironment(String env) async {
    final contents = await rootBundle.loadString(
      'assets/config/$env.json',
    );
    final json = jsonDecode(contents);
    return AppConfig(grpcHost: json['grpcHost'], grpcPort: json['grpcPort']);
  }
}