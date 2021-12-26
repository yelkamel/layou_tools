import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils.dart';

part 'user.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class User {
  String id;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  DateTime createDate;
  int nbAgree;
  int nbDissagree;
  int nbFaked;

  User({
    required this.id,
    required this.createDate,
    this.nbAgree = 0,
    this.nbDissagree = 0,
    this.nbFaked = 0,
  });

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => toJson().toString();
}
