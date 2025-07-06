import 'dart:developer' as dev;

enum LogLevel { debug, info, warning, error }

class AppLogger {
  static void log(String message, {LogLevel level = LogLevel.info, String? tag}) {
    final timestamp = DateTime.now().toIso8601String();
    final logTag = tag ?? 'AppQueue';
    final logMessage = '[$timestamp] [$logTag] ${level.name.toUpperCase()}: $message';
    
    switch (level) {
      case LogLevel.debug:
        dev.log(logMessage, name: logTag, level: 500);
        break;
      case LogLevel.info:
        dev.log(logMessage, name: logTag, level: 800);
        break;
      case LogLevel.warning:
        dev.log(logMessage, name: logTag, level: 900);
        break;
      case LogLevel.error:
        dev.log(logMessage, name: logTag, level: 1000);
        break;
    }
  }

  static void debug(String message, [String? tag]) => log(message, level: LogLevel.debug, tag: tag);
  static void info(String message, [String? tag]) => log(message, level: LogLevel.info, tag: tag);
  static void warning(String message, [String? tag]) => log(message, level: LogLevel.warning, tag: tag);
  static void error(String message, [String? tag]) => log(message, level: LogLevel.error, tag: tag);
}