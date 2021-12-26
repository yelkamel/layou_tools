// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citizen.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

/// Proxy class for `CopyWith` functionality. This is a callable class and can be used as follows: `instanceOfCitizen.copyWith(...)`. Be aware that this kind of usage does not support nullification and all passed `null` values will be ignored. Prefer to copy the instance with a specific field change that handles nullification of fields correctly, e.g. like this:`instanceOfCitizen.copyWith.fieldName(...)`
class _CitizenCWProxy {
  final Citizen _value;

  const _CitizenCWProxy(this._value);

  /// This function does not support nullification of optional types, all `null` values passed to this function will be ignored. For nullification, use `Citizen(...).copyWithNull(...)` to set certain fields to `null`. Prefer `Citizen(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Citizen(...).copyWith(id: 12, name: "My name")
  /// ````
  Citizen call({
    DateTime? createDate,
    String? id,
    int? nbAgree,
    int? nbDissagree,
    int? nbFaked,
  }) {
    return Citizen(
      createDate: createDate ?? _value.createDate,
      id: id ?? _value.id,
      nbAgree: nbAgree ?? _value.nbAgree,
      nbDissagree: nbDissagree ?? _value.nbDissagree,
      nbFaked: nbFaked ?? _value.nbFaked,
    );
  }

  Citizen createDate(DateTime createDate) => this(createDate: createDate);

  Citizen id(String id) => this(id: id);

  Citizen nbAgree(int nbAgree) => this(nbAgree: nbAgree);

  Citizen nbDissagree(int nbDissagree) => this(nbDissagree: nbDissagree);

  Citizen nbFaked(int nbFaked) => this(nbFaked: nbFaked);
}

extension CitizenCopyWith on Citizen {
  /// CopyWith feature provided by `copy_with_extension_gen` library. Returns a callable class and can be used as follows: `instanceOfclass Citizen.name.copyWith(...)`. Be aware that this kind of usage does not support nullification and all passed `null` values will be ignored. Prefer to copy the instance with a specific field change that handles nullification of fields correctly, e.g. like this:`instanceOfclass Citizen.name.copyWith.fieldName(...)`
  _CitizenCWProxy get copyWith => _CitizenCWProxy(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Citizen _$CitizenFromJson(Map<String, dynamic> json) => Citizen(
      id: json['id'] as String,
      createDate: dateTimefromJson(json['createDate'] as Timestamp),
      nbAgree: json['nbAgree'] as int? ?? 0,
      nbDissagree: json['nbDissagree'] as int? ?? 0,
      nbFaked: json['nbFaked'] as int? ?? 0,
    );

Map<String, dynamic> _$CitizenToJson(Citizen instance) => <String, dynamic>{
      'id': instance.id,
      'createDate': dateTimetoJson(instance.createDate),
      'nbAgree': instance.nbAgree,
      'nbDissagree': instance.nbDissagree,
      'nbFaked': instance.nbFaked,
    };
