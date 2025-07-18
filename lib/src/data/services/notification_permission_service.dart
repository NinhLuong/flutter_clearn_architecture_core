// ThinhNguyen
// 10:26 26/9/24

import 'package:cct_config/cct_config.dart';
import 'package:cct_core/src/data/datasources/local/permission_local.dart';
import 'package:cct_core/src/data/models/dynamic_notification_permission_config/dynamic_notification_permission_config.dart';
import 'package:hive/hive.dart';

class NotificationPermissionService {
  final PermissionLocal _local;
  DynamicNotificationPermissionConfig? _config;

  // Private constructor
  NotificationPermissionService._(this._local);

  // Singleton instance
  static final NotificationPermissionService _instance =
      NotificationPermissionService._(_instance._local);

  // Factory constructor to return the singleton instance
  factory NotificationPermissionService(
          Box<DynamicNotificationPermissionConfig> box) =>
      NotificationPermissionService(box);

  Future<void> init() async {
    await _local.init();
    _config = _local.getConfig();
  }

  DynamicNotificationPermissionConfig? get config => _config;

  Future<void> setConfig(DynamicNotificationPermissionConfig config) async {
    _config = config;
    await _local.setConfig(config);
  }

  bool shouldShowPermission(DynamicPermissionConfigSource page) {
    if (_config == null) return false;

    List<int> pagePermission;
    switch (page) {
      case DynamicPermissionConfigSource.home:
        pagePermission = _config!.homePage;
        break;
      case DynamicPermissionConfigSource.explore:
        pagePermission = _config!.explorePage;
        break;
      case DynamicPermissionConfigSource.community:
        pagePermission = _config!.community;
        break;
      case DynamicPermissionConfigSource.expert:
        pagePermission = _config!.expert;
        break;
      case DynamicPermissionConfigSource.profile:
        pagePermission = _config!.profile;
        break;
      default:
        return false;
    }

    int showHide = pagePermission[0];
    int repetitions = pagePermission[1];

    if (showHide == 0) {
      return true;
    } else {
      int shownCount = _local.getShownCount(page);
      return shownCount < repetitions;
    }
  }

  Future<void> markPermissionAsShown(String page, int permissionId) async {
    String key = '${page}_$permissionId';
    await _local.incrementShownCount(key);
  }

  Future<void> resetPermissionShownCount(String page, int permissionId) async {
    String key = '${page}_$permissionId';
    await _local.resetShownCount(key);
  }

  Future<void> loadConfigFromJson(Map<String, dynamic> json) async {
    _config = DynamicNotificationPermissionConfig.fromJson(json);
    await setConfig(_config!);
  }
}
