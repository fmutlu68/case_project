import 'package:flutter_case_project/core/base/model/base_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'interest_category.g.dart';

@JsonSerializable()
class InterestCategory extends BaseModel {
  int? id;
  String? name;

  InterestCategory({
    this.id,
    this.name,
  });

  factory InterestCategory.fromJson(Map<String, dynamic> json) =>
      _$InterestCategoryFromJson(json);

  Map<String, dynamic> get toJson => _$InterestCategoryToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$InterestCategoryFromJson(json);
}
