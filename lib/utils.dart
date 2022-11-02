part of layou_tools;

DateTime dateTimefromJson(Timestamp date) =>
    DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);

DateTime? dateTimefromJsonWithNull(Timestamp? date) => date == null
    ? null
    : dateTimefromJson(
        Timestamp.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch));

Timestamp dateTimetoJson(DateTime date) =>
    Timestamp.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);

Timestamp? dateTimetoJsonWithNull(DateTime? date) => date == null
    ? null
    : Timestamp.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);

Duration durationfromJson(int duration) => Duration(seconds: duration);

int durationtoJson(Duration duration) => duration.inSeconds;

String generateRandomId({int maxLenght = 20}) {
  const String AUTO_ID_ALPHABET =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  const int maxRandom = AUTO_ID_ALPHABET.length;
  final Random randomGen = Random();

  String id = '';
  for (int i = 0; i < maxLenght; i++) {
    id = id + AUTO_ID_ALPHABET[randomGen.nextInt(maxRandom)];
  }

  return id;
}
