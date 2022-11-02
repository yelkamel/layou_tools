part of layou_tools;

extension LaYouList<T> on List<T> {
  T get randomOne {
    if (length == 1) return this[0];
    return this[Random().nextInt(length)];
  }

  List<T> randomN(int n) {
    final arrayTmp = this;
    final List<T> res = [];

    for (var i = 0; i < n; i++) {
      final evoIndex = arrayTmp.length.randomFromZero;
      final T evoTmp = arrayTmp[evoIndex];
      arrayTmp.removeAt(evoIndex);
      res.add(evoTmp);
    }
    return res;
  }

  void swap(T a, T b) {
    final int index1 = this.indexOf(a);
    final int index2 = this.indexOf(b);

    this[index1] = b;
    this[index2] = a;
  }
}
