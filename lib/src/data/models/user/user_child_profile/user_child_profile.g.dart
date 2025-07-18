// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_child_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserChildProfileImpl _$$UserChildProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$UserChildProfileImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      gender: (json['gender'] as num).toInt(),
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$$UserChildProfileImplToJson(
        _$UserChildProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
    };
