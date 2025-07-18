// ThinhNguyen
// 10:37 26/9/24

import 'package:cct_config/cct_config.dart';
import 'package:cct_core/src/data/models/dynamic_notification_permission_config/dynamic_notification_permission_config.dart';
import 'package:hive/hive.dart';

class PermissionLocal {
  late Box<int> _permissionBox;
  late Box<DynamicNotificationPermissionConfig> _configBox;

  Future<void> init() async {
    Hive.registerAdapter(DynamicNotificationPermissionConfigImplAdapter());
    _permissionBox = await Hive.openBox<int>('permissions');
    _configBox = await Hive.openBox<DynamicNotificationPermissionConfig>('config');
  }

  Future<void> setConfig(DynamicNotificationPermissionConfig config) async {
    await _configBox.put('current', config);
  }

  DynamicNotificationPermissionConfig? getConfig() {
    return _configBox.get('current');
  }

  Future<void> incrementShownCount(String key) async {
    int shownCount = _permissionBox.get(key, defaultValue: 0)!;
    await _permissionBox.put(key, shownCount + 1);
  }

  int getShownCount(DynamicPermissionConfigSource key) {
    return _permissionBox.get(key.name, defaultValue: 0)!;
  }

  Future<void> resetShownCount(String key) async {
    await _permissionBox.delete(key);
  }
}