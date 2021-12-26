// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

/// Proxy class for `CopyWith` functionality. This is a callable class and can be used as follows: `instanceOfCandidate.copyWith(...)`. Be aware that this kind of usage does not support nullification and all passed `null` values will be ignored. Prefer to copy the instance with a specific field change that handles nullification of fields correctly, e.g. like this:`instanceOfCandidate.copyWith.fieldName(...)`
class _CandidateCWProxy {
  final Candidate _value;

  const _CandidateCWProxy(this._value);

  /// This function does not support nullification of optional types, all `null` values passed to this function will be ignored. For nullification, use `Candidate(...).copyWithNull(...)` to set certain fields to `null`. Prefer `Candidate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Candidate(...).copyWith(id: 12, name: "My name")
  /// ````
  Candidate call({
    String? campName,
    String? campPic,
    String? description,
    String? firstname,
    String? id,
    String? name,
    int? nbInfo,
    String? picUrl,
    int? totalAgree,
    int? totalDisagee,
    int? totalFake,
  }) {
    return Candidate(
      campName: campName ?? _value.campName,
      campPic: campPic ?? _value.campPic,
      description: description ?? _value.description,
      firstname: firstname ?? _value.firstname,
      id: id ?? _value.id,
      name: name ?? _value.name,
      nbInfo: nbInfo ?? _value.nbInfo,
      picUrl: picUrl ?? _value.picUrl,
      totalAgree: totalAgree ?? _value.totalAgree,
      totalDisagee: totalDisagee ?? _value.totalDisagee,
      totalFake: totalFake ?? _value.totalFake,
    );
  }

  Candidate campName(String campName) => this(campName: campName);

  Candidate campPic(String campPic) => this(campPic: campPic);

  Candidate description(String description) => this(description: description);

  Candidate firstname(String firstname) => this(firstname: firstname);

  Candidate id(String id) => this(id: id);

  Candidate name(String name) => this(name: name);

  Candidate nbInfo(int nbInfo) => this(nbInfo: nbInfo);

  Candidate picUrl(String picUrl) => this(picUrl: picUrl);

  Candidate totalAgree(int totalAgree) => this(totalAgree: totalAgree);

  Candidate totalDisagee(int totalDisagee) => this(totalDisagee: totalDisagee);

  Candidate totalFake(int totalFake) => this(totalFake: totalFake);
}

extension CandidateCopyWith on Candidate {
  /// CopyWith feature provided by `copy_with_extension_gen` library. Returns a callable class and can be used as follows: `instanceOfclass Candidate.name.copyWith(...)`. Be aware that this kind of usage does not support nullification and all passed `null` values will be ignored. Prefer to copy the instance with a specific field change that handles nullification of fields correctly, e.g. like this:`instanceOfclass Candidate.name.copyWith.fieldName(...)`
  _CandidateCWProxy get copyWith => _CandidateCWProxy(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
      id: json['id'] as String,
      firstname: json['firstname'] as String,
      name: json['name'] as String,
      picUrl: json['picUrl'] as String,
      description: json['description'] as String,
      campName: json['campName'] as String,
      campPic: json['campPic'] as String,
      nbInfo: json['nbInfo'] as int? ?? 0,
      totalDisagee: json['totalDisagee'] as int? ?? 0,
      totalAgree: json['totalAgree'] as int? ?? 0,
      totalFake: json['totalFake'] as int? ?? 0,
    );

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'description': instance.description,
      'campName': instance.campName,
      'campPic': instance.campPic,
      'nbInfo': instance.nbInfo,
      'totalDisagee': instance.totalDisagee,
      'totalAgree': instance.totalAgree,
      'totalFake': instance.totalFake,
    };
