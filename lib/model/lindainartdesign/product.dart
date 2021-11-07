import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  @JsonKey(ignore: true)
  String? id;
  String? email;
  String type;
  String backgroundType;
  int format;
  String? descr;
  String? text;
  String? filename;
  int nbOfPerson;
  @JsonKey(ignore: true)
  Uint8List? fileBytes;
  bool quick;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  DateTime? date;
  String status;

  Product({
    this.id,
    this.email,
    this.type = "portrait",
    this.backgroundType = "united",
    this.format = 4,
    this.descr,
    this.text,
    this.filename,
    this.nbOfPerson = 1,
    this.fileBytes,
    this.quick = false,
    required this.date,
    this.status = "notpay",
  });

  factory Product.fromJson(Map<String, dynamic> data, String docId) =>
      _$ProductFromJson({
        ...data,
        "id": docId,
      });

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  String toString() => toJson().toString();

  bool get isNumeric => format == 0;

  bool get isPortrait => type == 'portrait';
  bool get isPoster => type == 'poster';

  bool get isUnited => type == 'united';
  bool get isIllustrated => type == 'illustrated';

  bool get isNotpay => type == 'notpay';
  bool get isPayed => type == 'payed';
  bool get isRefused => type == 'refused';

  String get getUrlStripePaymentLink {
    if (totalPrice == 45) return "https://buy.stripe.com/00gaFV2MwboI6kMeVh";
    if (totalPrice == 50) return "https://buy.stripe.com/fZedS7fzi8cwbF68wU";

    if (totalPrice == 55) return "https://buy.stripe.com/00g3dtgDmeAU38A6oN";
    if (totalPrice == 60) return "https://buy.stripe.com/28o01hbj28cw5gIeVk";

    if (totalPrice == 65) return "https://buy.stripe.com/8wM8xNgDm1O8dNeaF5";
    if (totalPrice == 70) return "https://buy.stripe.com/eVa01h1IsboIfVmcNe";

    if (totalPrice == 75) return "https://buy.stripe.com/dR6dS772M8cw9wYeVn";
    if (totalPrice == 80) return "https://buy.stripe.com/8wM6pFbj21O86kMaF8";

    if (totalPrice == 85) return "https://buy.stripe.com/bIY6pF72M1O824w28E";
    if (totalPrice == 90) return "https://buy.stripe.com/00g8xN9aUfEYdNefZt";

    if (totalPrice == 95) return "https://buy.stripe.com/bIYeWb9aUakEdNe6oW";
    if (totalPrice == 100) return "https://buy.stripe.com/fZe8xNfzi0K45gI14B";

    return "https://lindainartdesign-merci.web.app/";
  }

  double calculateWithOptionPrice(int basePrice) =>
      basePrice +
      (isIllustrated ? 15 : 0) +
      (isNumeric ? 0 : 5) +
      (quick ? (basePrice * 25 / 100).round().toDouble() : 0);

  double get totalPrice {
    if (nbOfPerson == 1) return calculateWithOptionPrice(45);
    if (nbOfPerson == 2) return calculateWithOptionPrice(55);
    if (nbOfPerson == 3) return calculateWithOptionPrice(65);
    if (nbOfPerson == 4) return calculateWithOptionPrice(75);
    if (nbOfPerson == 5) return calculateWithOptionPrice(85);
    if (nbOfPerson == 6) return calculateWithOptionPrice(95);

    return 45.0;
  }
}
