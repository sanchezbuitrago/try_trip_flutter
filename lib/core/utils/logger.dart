import 'package:logger/logger.dart';

class CustomLogger {
  static final CustomLogger _instance = CustomLogger._internal();
  final Logger _logger = Logger(
    level: Level.debug,
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );
  CustomLogger._internal();

  static CustomLogger get instance => _instance;

  void logInfo(String message) {
    _logger.i(message);
  }

  void logWarning(String message) {
    _logger.w(message);
  }

  void logError(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  void logDebug(String message) {
    _logger.d(message);
  }
}
