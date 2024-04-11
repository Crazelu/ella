import 'dart:developer' as dev;

class LoggerFactory {
  LoggerFactory._();

  static Logger getLogger([Object? scope]) => _Logger(scope?.toString());
}

abstract class Logger {
  Logger._();

  static bool _canShowLogs = false;

  static void showLogs() {
    _canShowLogs = true;
  }

  static void hideLogs() {
    _canShowLogs = false;
  }

  void info(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  });

  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  });

  void severe(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  });
}

class _Logger implements Logger {
  _Logger([this.scope]);

  final String? scope;

  void _log(
    String message, {
    int level = 0,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (Logger._canShowLogs) {
      dev.log(
        message,
        level: level,
        error: error,
        stackTrace: stackTrace,
        name: scope ?? '',
      );
    }
  }

  @override
  void info(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) =>
      _log(
        message,
        level: 800,
        error: error,
        stackTrace: stackTrace,
      );

  @override
  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) =>
      _log(
        message,
        level: 900,
        error: error,
        stackTrace: stackTrace,
      );

  @override
  void severe(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) =>
      _log(
        message,
        level: 1000,
        error: error,
        stackTrace: stackTrace,
      );
}
