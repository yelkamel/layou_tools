// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      email: json['email'] as String?,
      type: json['type'] == null
          ? ProductType.portrait
          : productTypeFromJson(json['type'] as String?),
      descr: json['descr'] as String?,
      text: json['text'] as String?,
      filename: json['filename'] as String?,
      format: json['format'] as int? ?? 4,
      nbOfPerson: json['nbOfPerson'] as int? ?? 1,
      backgroundType: json['backgroundType'] == null
          ? BackgroundType.united
          : backgroundTypeFromJson(json['backgroundType'] as String?),
      quick: json['quick'] as bool? ?? false,
      date: dateTimefromJson(json['date'] as Timestamp?),
      status: json['status'] == null
          ? ProductStatus.notpay
          : productStatusFromJson(json['status'] as String?),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'type': productTypeToJson(instance.type),
      'descr': instance.descr,
      'text': instance.text,
      'filename': instance.filename,
      'format': instance.format,
      'nbOfPerson': instance.nbOfPerson,
      'backgroundType': backgroundTypeToJson(instance.backgroundType),
      'quick': instance.quick,
      'date': dateTimetoJson(instance.date),
      'status': productStatusToJson(instance.status),
    };
