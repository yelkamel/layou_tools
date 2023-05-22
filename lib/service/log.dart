import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';

mixin MyLog implements LoggyType {
  @override
  Loggy<MyLog> get loggy => Loggy<MyLog>('[$runtimeType]');
}

class Log {
  static void init() {
    Loggy.initLoggy(
      logPrinter: const MyPrettyPrinter(),
    );
  }
}

class MyPrettyPrinter extends LoggyPrinter {
  const MyPrettyPrinter({
    this.showColors,
  }) : super();

  final bool? showColors;

  bool get _colorize => showColors ?? false;

  static final _levelColors = {
    LogLevel.debug:
        AnsiColor(foregroundColor: AnsiColor.grey(0.5), italic: true),
    LogLevel.info: AnsiColor(foregroundColor: 35),
    LogLevel.warning: AnsiColor(foregroundColor: 214),
    LogLevel.error: AnsiColor(foregroundColor: 196),
  };

  static final _levelPrefixes = {
    LogLevel.debug: '🧐',
    LogLevel.info: '😙',
    LogLevel.warning: '😏',
    LogLevel.error: '🤬',
  };

  static const _defaultPrefix = '🤔';

  @override
  void onLog(LogRecord record) {
    // final _time = record.time.toIso8601String().split('T')[1].split('.').first;
    final _callerFrame =
        record.callerFrame == null ? '' : '(${record.callerFrame?.location})';
    // final _logLevel = record.level
    //     .toString()
    //     .replaceAll('Level.', '')
    //     .toUpperCase()
    //     .padRight(8);

    final _color =
        _colorize ? levelColor(record.level) ?? AnsiColor() : AnsiColor();
    final _prefix = levelPrefix(record.level) ?? _defaultPrefix;

    debugPrint(_color(
        '$_prefix ${record.loggerName.contains("Loggy") ? "" : "${record.loggerName} "}$_callerFrame${record.message}'));

    if (record.stackTrace != null) {
      // ignore: avoid_print
      print(record.stackTrace);
    }
  }

  String? levelPrefix(LogLevel level) {
    return _levelPrefixes[level];
  }

  AnsiColor? levelColor(LogLevel level) {
    return _levelColors[level];
  }
}
