import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils.dart';

part 'candidate.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class Candidate {
  String id;
  String firstname;
  String name;
  String picUrl;
  String description;
  String campName;
  String campPic;
  int nbInfo;
  int totalDisagee;
  int totalAgree;
  int totalFake;

  Candidate({
    required this.id,
    required this.firstname,
    required this.name,
    required this.picUrl,
    required this.description,
    required this.campName,
    required this.campPic,
    this.nbInfo = 0,
    this.totalDisagee = 0,
    this.totalAgree = 0,
    this.totalFake = 0,
  });

  factory Candidate.fromJson(Map<String, dynamic> data) =>
      _$CandidateFromJson(data);

  Map<String, dynamic> toJson() => _$CandidateToJson(this);

  @override
  String toString() => toJson().toString();
}
