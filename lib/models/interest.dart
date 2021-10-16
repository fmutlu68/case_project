import 'package:flutter_case_project/core/base/model/base_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'interest.g.dart';

@JsonSerializable()
class Interest extends BaseModel {
  int? id;
  String? interests;
  int? categoryId;

  Interest({this.id, this.interests, this.categoryId});

  factory Interest.fromJson(Map<String, dynamic> json) =>
      _$InterestFromJson(json);

  Map<String, dynamic> get toJson => _$InterestToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$InterestFromJson(json);
}
