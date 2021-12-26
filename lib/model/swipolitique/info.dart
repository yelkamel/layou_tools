import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils.dart';

part 'info.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class Info {
  String id;
  @JsonKey(toJson: dateTimetoJson, fromJson: dateTimefromJson)
  DateTime createDate;
  String candidateId;
  String name;
  String? gsUrl;
  String text;
  int balance; // - 1, 0, 1
  int nbFaked;
  int nbView;
  // avoir une section fastchecking avec liste des fait des checkers

  Info({
    required this.id,
    required this.createDate,
    required this.candidateId,
    required this.name,
    this.gsUrl,
    required this.text,
    this.balance = 0,
    this.nbFaked = 0,
    this.nbView = 0,
  });

  factory Info.fromJson(Map<String, dynamic> data) => _$InfoFromJson(data);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  @override
  String toString() => toJson().toString();
}
