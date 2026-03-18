import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/app_strings.dart';
import 'env_config.dart';

class AppConfig {
  const AppConfig({required this.environment, required this.env});

  final AppEnvironment environment;
  final EnvConfig env;

  String get appName => AppStrings.appName;
  String get environmentLabel => environment.label;
  bool get isProduction => environment == AppEnvironment.prod;

  static Future<AppConfig> bootstrap() async {
    final environment = AppEnvironment.fromValue(
      const String.fromEnvironment('APP_ENV', defaultValue: 'dev'),
    );

    await dotenv.load(fileName: environment.assetName);

    return AppConfig(
      environment: environment,
      env: EnvConfig(
        apiBaseUrl: dotenv.get('API_BASE_URL'),
        webSocketBaseUrl: dotenv.get('WS_BASE_URL'),
        connectTimeout: Duration(
          milliseconds: int.parse(
            dotenv.get('CONNECT_TIMEOUT_MS', fallback: '30000'),
          ),
        ),
        receiveTimeout: Duration(
          milliseconds: int.parse(
            dotenv.get('RECEIVE_TIMEOUT_MS', fallback: '30000'),
          ),
        ),
        enableDioLogging:
            dotenv.get('ENABLE_DIO_LOGGING', fallback: 'false') == 'true',
      ),
    );
  }
}
