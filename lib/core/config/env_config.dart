import 'package:flutter/foundation.dart';

enum AppEnvironment {
  dev,
  staging,
  prod;

  static AppEnvironment fromValue(String value) {
    switch (value.toLowerCase()) {
      case 'prod':
      case 'production':
        return AppEnvironment.prod;
      case 'staging':
        return AppEnvironment.staging;
      case 'dev':
      case 'development':
      default:
        return AppEnvironment.dev;
    }
  }

  String get assetName => '.env.$name';

  String get label => switch (this) {
    AppEnvironment.dev => 'Development',
    AppEnvironment.staging => 'Staging',
    AppEnvironment.prod => 'Production',
  };
}

@immutable
class EnvConfig {
  const EnvConfig({
    required this.apiBaseUrl,
    required this.webSocketBaseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.enableDioLogging,
  });

  final String apiBaseUrl;
  final String webSocketBaseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final bool enableDioLogging;
}
