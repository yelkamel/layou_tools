part of layoutools;

extension LaYouList<T> on List<T> {
  T get oneRandom {
    if (length == 1) return this[0];
    return this[Random().nextInt(length - 1)];
  }
}

extension LaYouDuration on Duration {
  String minuteSecondFormatted() {
    return [
      if (inSeconds > 3600) inHours.remainder(24),
      inMinutes.remainder(60),
      inSeconds.remainder(60)
    ].map((seg) {
      return seg.toString().padLeft(2, '0');
    }).join(':');
  }
}

extension LaYouString on String {
  static final emailRegex =
      '^([\\w\\d\\-\\+]+)(\\.+[\\w\\d\\-\\+%]+)*@([\\w\\-]+\\.){1,5}(([A-Za-z]){2,30}|xn--[A-Za-z0-9]{1,26})\$';

  bool get isEmail {
    var regExp = RegExp(emailRegex);
    return regExp.hasMatch(this);
  }
}

extension LaYouInt on int {
  String get minFormatFromSecondes => "${(this / 60).round().toString()} min";

  bool get pourcentageOfChance => Random().nextInt(99) + 1 <= this;

  int get randomFromZero {
    return Random().nextInt(this);
  }
}

extension LaYouDateTime on DateTime {
  String get timeStringFromDate {
    return DateFormat.Hm().format(this);
  }

  bool get isMorningTime {
    final startTime = DateTime(year, month, day, 05, 59);
    final endTime = DateTime(year, month, day, 12, 01);
    return !(isAfter(startTime) && isBefore(endTime));
  }

  bool get isNightTime {
    final startTime = DateTime(year, month, day, 18, 59);
    final endTime = DateTime(year, month, day, 24, 01);
    return !(isAfter(startTime) && isBefore(endTime));
  }

  bool get isToday {
    if (this == null) return false;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final aDate = DateTime(year, month, day);
    return aDate == today;
  }

  String get toDayMonth {
    return DateFormat('d MMMM', 'fr_FR').format(this);
  }
}
