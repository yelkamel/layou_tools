part of layou_tools;

extension LaYouInt on int {
  String get formatToMinFromSec => "${(this / 60).round().toString()} min";

  bool get pourcentageOfChance => Random().nextInt(99) + 1 <= this;

  int get randomFromZero {
    return Random().nextInt(this);
  }
}
