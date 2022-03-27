import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

DateTime dateTimefromJson(Timestamp date) {
  return DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);
}

DateTime? dateTimefromJsonWithNull(Timestamp? date) => date == null
    ? null
    : DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);

Timestamp? dateTimetoJsonWithNull(DateTime? date) => date == null
    ? null
    : Timestamp.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);

Timestamp dateTimetoJson(DateTime date) {
  return Timestamp.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);
}

Duration durationfromJson(int duration) {
  return Duration(seconds: duration);
}

int durationtoJson(Duration duration) {
  return duration.inSeconds;
}

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
