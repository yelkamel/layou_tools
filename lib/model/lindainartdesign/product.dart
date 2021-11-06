import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:enum_object/enum_object.dart';

import '../utils.dart';

part 'product.g.dart';

enum ProductType {
  portrait,
  poster,
  minimaliste,
}

enum BackgroundType {
  united,
  illustrated,
}

enum ProductStatus {
  notpay,
  payed,
  refused,
}

@JsonSerializable(explicitToJson: true)
class Product {
  String? id;
  String? email;
  @JsonKey(toJson: productTypeToJson, fromJson: productTypeFromJson)
  ProductType? type;
  String? descr;
  String? text;
  String? filename;
  int format;
  int nbOfPerson;
  @JsonKey(toJson: backgroundTypeToJson, fromJson: backgroundTypeFromJson)
  BackgroundType? backgroundType;
  @JsonKey(ignore: true)
  Uint8List? fileBytes;
  bool quick;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  DateTime? date;
  @JsonKey(toJson: productStatusToJson, fromJson: productStatusFromJson)
  ProductStatus? status;

  Product({
    this.id,
    this.email,
    this.type = ProductType.portrait,
    this.descr,
    this.text,
    this.filename,
    this.format = 4,
    this.nbOfPerson = 1,
    this.backgroundType = BackgroundType.united,
    this.fileBytes,
    this.quick = false,
    required this.date,
    this.status = ProductStatus.notpay,
  });

  factory Product.fromJson(Map<String, dynamic> data, String docId) =>
      _$ProductFromJson({
        ...data,
        "id": docId,
      });

  Map<String, dynamic> toJson() => _$ProductToJson(this);
  @override
  String toString() =>
      '===> Product\n=> type:$type\n=> email:$email\n=> filename:$filename\n=> format:$format\n=> nbOfPerson:$nbOfPerson\n=> backgroundType:$backgroundType\n=> quick:$quick\n=> descr:$descr';

/*
https://lindainartdesign-merci.web.app/
*/
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

  double get totalPrice {
    if (nbOfPerson == 1) {
      final basePrice = 57;
      return basePrice +
          (backgroundType == BackgroundType.illustrated ? 15 : 0) +
          (format == 4 ? 10 : 0) +
          (quick ? (basePrice * 25 / 100).round().toDouble() : 0);
    }

    if (nbOfPerson == 2) {
      final basePrice = 77;
      return basePrice +
          (backgroundType == BackgroundType.illustrated ? 15 : 0) +
          (format == 4 ? 10 : 0) +
          (quick ? (basePrice * 25 / 100).round().toDouble() : 0);
    }

    if (nbOfPerson == 3) {
      final basePrice = 97;
      return basePrice +
          (backgroundType == BackgroundType.illustrated ? 15 : 0) +
          (format == 4 ? 10 : 0) +
          (quick ? (basePrice * 25 / 100).round().toDouble() : 0);
    }
    if (nbOfPerson == 4) {
      final basePrice = 117;
      return basePrice +
          (backgroundType == BackgroundType.illustrated ? 15 : 0) +
          (format == 4 ? 10 : 0) +
          (quick ? (basePrice * 25 / 100).round().toDouble() : 0);
    }

    final basePrice = 137;
    return basePrice +
        (backgroundType == BackgroundType.illustrated ? 15 : 0) +
        (format == 4 ? 10 : 0) +
        (quick ? (basePrice * 25 / 100).round().toDouble() : 0);
  }
}

ProductType? productTypeFromJson(String? str) {
  if (str == null) return null;
  var enumObject = EnumObject<ProductType>(ProductType.values);
  return enumObject.enumFromString(str);
}

String? productTypeToJson(ProductType? type) {
  if (type == null) return null;
  return type.enumValue;
}

ProductStatus? productStatusFromJson(String? str) {
  if (str == null) return null;
  var enumObject = EnumObject<ProductStatus>(ProductStatus.values);
  return enumObject.enumFromString(str);
}

String? productStatusToJson(ProductStatus? type) {
  if (type == null) return null;
  return type.enumValue;
}

BackgroundType? backgroundTypeFromJson(String? str) {
  if (str == null) return null;
  var enumObject = EnumObject<BackgroundType>(ProductType.values);
  return enumObject.enumFromString(str);
}

String? backgroundTypeToJson(BackgroundType? type) {
  if (type == null) return null;
  return type.enumValue;
}
