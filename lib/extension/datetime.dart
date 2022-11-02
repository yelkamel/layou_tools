part of layou_tools;

extension LaYouDateTime on DateTime {
  String get formatToTime {
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
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final aDate = DateTime(year, month, day);
    return aDate == today;
  }

  String get formatToDayMonthFr {
    return DateFormat('d MMMM', 'fr_FR').format(this);
  }
}
