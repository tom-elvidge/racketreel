import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  final String grpcHost;
  final int grpcPort;
  final String usersGrpcHost;
  final int usersGrpcPort;

  AppConfig({
    required this.grpcHost,
    required this.grpcPort,
    required this.usersGrpcHost,
    required this.usersGrpcPort,
  });

  static Future<AppConfig> forEnvironment(String env) async {
    final contents = await rootBundle.loadString(
      // 'assets/config/$env.json',
      'assets/config/live.json',
    );
    final json = jsonDecode(contents);
    return AppConfig(
        grpcHost: json['grpcHost'],
        grpcPort: json['grpcPort'],
        usersGrpcHost: json['usersGrpcHost'],
        usersGrpcPort: json['usersGrpcPort'],
    );
  }
}