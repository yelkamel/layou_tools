part of layoutools;

extension LaYouString<T> on String {
  static final emailRegex =
      '^([\\w\\d\\-\\+]+)(\\.+[\\w\\d\\-\\+%]+)*@([\\w\\-]+\\.){1,5}(([A-Za-z]){2,30}|xn--[A-Za-z0-9]{1,26})\$';

  bool get isEmail {
    var regExp = RegExp(emailRegex);
    return regExp.hasMatch(this);
  }

  String spaceRemoved() {
    return replaceFirst(" ", "");
  }

  Color get hexToColor => Color(int.parse("0xff${replaceAll('#', '')}"));

  String get prefix {
    final indexOfDot = this.indexOf('.');
    return this.substring(0, indexOfDot);
  }
}
