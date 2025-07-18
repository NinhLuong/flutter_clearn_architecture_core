// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_notification_permission_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DynamicNotificationPermissionConfigImplAdapter
    extends TypeAdapter<_$DynamicNotificationPermissionConfigImpl> {
  @override
  final int typeId = 1;

  @override
  _$DynamicNotificationPermissionConfigImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$DynamicNotificationPermissionConfigImpl(
      homePage: (fields[0] as List).cast<int>(),
      explorePage: (fields[1] as List).cast<int>(),
      community: (fields[2] as List).cast<int>(),
      expert: (fields[3] as List).cast<int>(),
      profile: (fields[4] as List).cast<int>(),
    );
  }

  @override
  void write(
      BinaryWriter writer, _$DynamicNotificationPermissionConfigImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.homePage)
      ..writeByte(1)
      ..write(obj.explorePage)
      ..writeByte(2)
      ..write(obj.community)
      ..writeByte(3)
      ..write(obj.expert)
      ..writeByte(4)
      ..write(obj.profile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DynamicNotificationPermissionConfigImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DynamicNotificationPermissionConfigImpl
    _$$DynamicNotificationPermissionConfigImplFromJson(
            Map<String, dynamic> json) =>
        _$DynamicNotificationPermissionConfigImpl(
          homePage: (json['homePage'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
          explorePage: (json['explorePage'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
          community: (json['community'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
          expert: (json['expert'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
          profile: (json['profile'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
        );

Map<String, dynamic> _$$DynamicNotificationPermissionConfigImplToJson(
        _$DynamicNotificationPermissionConfigImpl instance) =>
    <String, dynamic>{
      'homePage': instance.homePage,
      'explorePage': instance.explorePage,
      'community': instance.community,
      'expert': instance.expert,
      'profile': instance.profile,
    };
