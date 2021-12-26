// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

/// Proxy class for `CopyWith` functionality. This is a callable class and can be used as follows: `instanceOfUser.copyWith(...)`. Be aware that this kind of usage does not support nullification and all passed `null` values will be ignored. Prefer to copy the instance with a specific field change that handles nullification of fields correctly, e.g. like this:`instanceOfUser.copyWith.fieldName(...)`
class _UserCWProxy {
  final User _value;

  const _UserCWProxy(this._value);

  /// This function does not support nullification of optional types, all `null` values passed to this function will be ignored. For nullification, use `User(...).copyWithNull(...)` to set certain fields to `null`. Prefer `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    DateTime? createDate,
    String? id,
    int? nbAgree,
    int? nbDissagree,
    int? nbFaked,
  }) {
    return User(
      createDate: createDate ?? _value.createDate,
      id: id ?? _value.id,
      nbAgree: nbAgree ?? _value.nbAgree,
      nbDissagree: nbDissagree ?? _value.nbDissagree,
      nbFaked: nbFaked ?? _value.nbFaked,
    );
  }

  User createDate(DateTime createDate) => this(createDate: createDate);

  User id(String id) => this(id: id);

  User nbAgree(int nbAgree) => this(nbAgree: nbAgree);

  User nbDissagree(int nbDissagree) => this(nbDissagree: nbDissagree);

  User nbFaked(int nbFaked) => this(nbFaked: nbFaked);
}

extension UserCopyWith on User {
  /// CopyWith feature provided by `copy_with_extension_gen` library. Returns a callable class and can be used as follows: `instanceOfclass User.name.copyWith(...)`. Be aware that this kind of usage does not support nullification and all passed `null` values will be ignored. Prefer to copy the instance with a specific field change that handles nullification of fields correctly, e.g. like this:`instanceOfclass User.name.copyWith.fieldName(...)`
  _UserCWProxy get copyWith => _UserCWProxy(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      createDate: dateTimefromJson(json['createDate'] as Timestamp),
      nbAgree: json['nbAgree'] as int? ?? 0,
      nbDissagree: json['nbDissagree'] as int? ?? 0,
      nbFaked: json['nbFaked'] as int? ?? 0,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'createDate': dateTimetoJson(instance.createDate),
      'nbAgree': instance.nbAgree,
      'nbDissagree': instance.nbDissagree,
      'nbFaked': instance.nbFaked,
    };
