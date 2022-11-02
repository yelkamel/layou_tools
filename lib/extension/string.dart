part of layou_tools;

extension LaYouString<T> on String {
  static final emailRegex =
      '^([\\w\\d\\-\\+]+)(\\.+[\\w\\d\\-\\+%]+)*@([\\w\\-]+\\.){1,5}(([A-Za-z]){2,30}|xn--[A-Za-z0-9]{1,26})\$';

  bool get isEmail {
    var regExp = RegExp(emailRegex);
    return regExp.hasMatch(this);
  }

  String get removeSpaces {
    return replaceFirst(" ", "");
  }

  String get removeDiacritics {
    String res = '';

    for (int i = 0; i < this.length; i++) {
      final utf8 = this.codeUnitAt(i);
      if (utf8 < 768 || utf8 > 879) {
        res += this[i];
      }
    }
    return res;
  }

  String get capitalizeFirst =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  Color get hexToColor => Color(int.parse("0xff${replaceAll('#', '')}"));

  String get prefix {
    final indexOfDot = this.indexOf('.');
    return this.substring(0, indexOfDot);
  }

  bool get isNumeric => double.tryParse(this) != null;
  String get fileExtension => split('.').last;
}
