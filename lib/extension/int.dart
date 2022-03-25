part of layoutools;

extension LaYouInt on int {
  String get minFormatFromSecondes => "${(this / 60).round().toString()} min";

  bool get pourcentageOfChance => Random().nextInt(99) + 1 <= this;

  int get fromZeroRandom {
    return Random().nextInt(this);
  }
}
