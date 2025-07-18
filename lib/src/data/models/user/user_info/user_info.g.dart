// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      userProfile:
          UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
      userRoles: (json['userRoles'] as List<dynamic>?)
              ?.map((e) => UserRole.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      childProfiles: (json['childProfiles'] as List<dynamic>?)
              ?.map((e) => UserChildProfile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'userProfile': instance.userProfile,
      'userRoles': instance.userRoles,
      'childProfiles': instance.childProfiles,
    };
