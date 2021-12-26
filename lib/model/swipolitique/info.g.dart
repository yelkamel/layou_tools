// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

/// Proxy class for `CopyWith` functionality. This is a callable class and can be used as follows: `instanceOfInfo.copyWith(...)`. Be aware that this kind of usage does not support nullification and all passed `null` values will be ignored. Prefer to copy the instance with a specific field change that handles nullification of fields correctly, e.g. like this:`instanceOfInfo.copyWith.fieldName(...)`
class _InfoCWProxy {
  final Info _value;

  const _InfoCWProxy(this._value);

  /// This function does not support nullification of optional types, all `null` values passed to this function will be ignored. For nullification, use `Info(...).copyWithNull(...)` to set certain fields to `null`. Prefer `Info(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Info(...).copyWith(id: 12, name: "My name")
  /// ````
  Info call({
    int? balance,
    String? candidateId,
    DateTime? createDate,
    String? gsUrl,
    String? id,
    String? name,
    int? nbFaked,
    int? nbView,
    String? text,
  }) {
    return Info(
      balance: balance ?? _value.balance,
      candidateId: candidateId ?? _value.candidateId,
      createDate: createDate ?? _value.createDate,
      gsUrl: gsUrl ?? _value.gsUrl,
      id: id ?? _value.id,
      name: name ?? _value.name,
      nbFaked: nbFaked ?? _value.nbFaked,
      nbView: nbView ?? _value.nbView,
      text: text ?? _value.text,
    );
  }

  Info gsUrl(String? gsUrl) =>
      gsUrl == null ? _value._copyWithNull(gsUrl: true) : this(gsUrl: gsUrl);

  Info balance(int balance) => this(balance: balance);

  Info candidateId(String candidateId) => this(candidateId: candidateId);

  Info createDate(DateTime createDate) => this(createDate: createDate);

  Info id(String id) => this(id: id);

  Info name(String name) => this(name: name);

  Info nbFaked(int nbFaked) => this(nbFaked: nbFaked);

  Info nbView(int nbView) => this(nbView: nbView);

  Info text(String text) => this(text: text);
}

extension InfoCopyWith on Info {
  /// CopyWith feature provided by `copy_with_extension_gen` library. Returns a callable class and can be used as follows: `instanceOfclass Info.name.copyWith(...)`. Be aware that this kind of usage does not support nullification and all passed `null` values will be ignored. Prefer to copy the instance with a specific field change that handles nullification of fields correctly, e.g. like this:`instanceOfclass Info.name.copyWith.fieldName(...)`
  _InfoCWProxy get copyWith => _InfoCWProxy(this);

  Info _copyWithNull({
    bool gsUrl = false,
  }) {
    return Info(
      balance: balance,
      candidateId: candidateId,
      createDate: createDate,
      gsUrl: gsUrl == true ? null : this.gsUrl,
      id: id,
      name: name,
      nbFaked: nbFaked,
      nbView: nbView,
      text: text,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      id: json['id'] as String,
      createDate: dateTimefromJson(json['createDate'] as Timestamp),
      candidateId: json['candidateId'] as String,
      name: json['name'] as String,
      gsUrl: json['gsUrl'] as String?,
      text: json['text'] as String,
      balance: json['balance'] as int? ?? 0,
      nbFaked: json['nbFaked'] as int? ?? 0,
      nbView: json['nbView'] as int? ?? 0,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'id': instance.id,
      'createDate': dateTimetoJson(instance.createDate),
      'candidateId': instance.candidateId,
      'name': instance.name,
      'gsUrl': instance.gsUrl,
      'text': instance.text,
      'balance': instance.balance,
      'nbFaked': instance.nbFaked,
      'nbView': instance.nbView,
    };
