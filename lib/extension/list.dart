part of layoutools;

extension LaYouList<T> on List<T> {
  T get oneRandom {
    if (length == 1) return this[0];
    return this[Random().nextInt(length)];
  }
}
