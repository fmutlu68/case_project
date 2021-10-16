// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Interest _$InterestFromJson(Map<String, dynamic> json) {
  return Interest(
    id: json['id'] as int?,
    interests: json['interests'] as String?,
    categoryId: json['category_id'] as int?,
  );
}

Map<String, dynamic> _$InterestToJson(Interest instance) => <String, dynamic>{
      'id': instance.id,
      'interests': instance.interests,
      'category_id': instance.categoryId,
    };
