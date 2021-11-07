// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String? ?? "portrait",
      backgroundType: json['backgroundType'] as String? ?? "united",
      descr: json['descr'] as String?,
      text: json['text'] as String?,
      filename: json['filename'] as String?,
      quick: json['quick'] as bool? ?? false,
      date: dateTimefromJson(json['date'] as Timestamp?),
      status: json['status'] as String? ?? "notpay",
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'type': instance.type,
      'backgroundType': instance.backgroundType,
      'descr': instance.descr,
      'text': instance.text,
      'filename': instance.filename,
      'quick': instance.quick,
      'date': dateTimetoJson(instance.date),
      'status': instance.status,
    };
