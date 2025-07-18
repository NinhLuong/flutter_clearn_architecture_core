// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      displayName: json['displayName'] as String? ?? "Chưa Đặt Tên",
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      imgUrl:
          const AttachmentOrNullConverter().fromJson(json['imgUrl'] as String?),
      email: json['email'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'imgUrl': const AttachmentOrNullConverter().toJson(instance.imgUrl),
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
