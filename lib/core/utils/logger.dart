import 'package:logger/logger.dart' as logger_package;

abstract final class AppLogger {
  static final logger_package.Logger _logger = logger_package.Logger();

  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
