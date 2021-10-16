import 'package:flutter_case_project/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseModel {
  int? id;
  String? username;
  String? password;
  String? role;
  User({
    this.id,
    this.username,
    this.password,
    this.role,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> get toJson => _$UserToJson(this);
}

enum UserTypes { ADMIN, USER }
