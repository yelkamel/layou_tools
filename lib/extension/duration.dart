part of layoutools;

extension LaYouDuration on Duration {
  String hhmmssFormat() {
    return [
      if (inSeconds > 3600) inHours.remainder(24),
      inMinutes.remainder(60),
      inSeconds.remainder(60)
    ].map((seg) {
      return seg.toString().padLeft(2, '0');
    }).join(':');
  }
}
