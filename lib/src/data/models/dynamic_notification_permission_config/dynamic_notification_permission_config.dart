// ThinhNguyen
// 10:33 26/9/24

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'dynamic_notification_permission_config.freezed.dart';
part 'dynamic_notification_permission_config.g.dart';

@freezed
class DynamicNotificationPermissionConfig with _$DynamicNotificationPermissionConfig {
  @HiveType(typeId: 1)
  factory DynamicNotificationPermissionConfig({
    @HiveField(0) required List<int> homePage,
    @HiveField(1) required List<int> explorePage,
    @HiveField(2) required List<int> community,
    @HiveField(3) required List<int> expert,
    @HiveField(4) required List<int> profile,
  }) = _DynamicNotificationPermissionConfig;

  factory DynamicNotificationPermissionConfig.fromJson(Map<String, dynamic> json) =>
      _$DynamicNotificationPermissionConfigFromJson(json);
}