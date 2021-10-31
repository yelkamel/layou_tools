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
    if (totalPrice == 57) return "https://buy.stripe.com/bIYaFVcn678s4cEaEE";
    if (totalPrice == 67) return "https://buy.stripe.com/5kA3dtgDm64odNe5km";
    if (totalPrice == 82) return "https://buy.stripe.com/6oE4hxaeY78sdNe8wA";
    if (totalPrice == 72) return "https://buy.stripe.com/7sIdS7fzi78s9wYbIL";

    if (totalPrice == 77) return "https://buy.stripe.com/6oEg0f2Mw3WgfVm7st";
    if (totalPrice == 87) return "https://buy.stripe.com/9AQ3dt0EoboIcJaaEJ";
    if (totalPrice == 92) return "https://buy.stripe.com/4gw01h5YIakE9wYdQW";
    if (totalPrice == 102) return "https://buy.stripe.com/14kdS7cn62Sc8sUfZ5";

    if (totalPrice == 97) return "https://buy.stripe.com/8wMbJZ0Eo50kbF68wE";
    if (totalPrice == 107) return "https://buy.stripe.com/00g5lB4UEgJ224wfZ7";
    if (totalPrice == 112) return "https://buy.stripe.com/fZeeWbfzi0K4gZq9AK";
    if (totalPrice == 122) return "https://buy.stripe.com/9AQ15l4UEfEY24wbIT";

    if (totalPrice == 117) return "https://buy.stripe.com/28o01h4UEdwQ10s3co";
    if (totalPrice == 127) return "https://buy.stripe.com/bIY4hxdra9gA9wY9AO";
    if (totalPrice == 132) return "https://buy.stripe.com/28ocO3eve1O88sUaET";
    if (totalPrice == 142) return "https://buy.stripe.com/bIY6pF4UEakE9wY6oB";

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
