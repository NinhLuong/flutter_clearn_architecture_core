import 'package:cct_config/cct_config.dart';
import 'package:cct_core/cct_core.dart';
import 'package:cct_core/src/data/models/dynamic_notification_permission_config/dynamic_notification_permission_config.dart';
import 'package:cct_core/src/data/repositories/network_info_repo_impl.dart';
import 'package:cct_core/src/data/repositories/user_info_client_repo_impl.dart';
import 'package:cct_core/src/data/services/auth_service.dart';
import 'package:cct_core/src/data/services/notification_permission_service.dart';
import 'package:cct_core/src/domain/repositories/network_info_repo.dart';
import 'package:cct_core/src/domain/repositories/user_info_client_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingletonAsync<Box<Auth>>(() async {
    final box = await Hive.openBox<Auth>('auth_box');
    return box;
  });

  getIt.registerSingletonAsync<Box<DynamicNotificationPermissionConfig>>(
      () async {
    final box = await Hive.openBox<DynamicNotificationPermissionConfig>(
        'dynamic_notification_permission_config_box');
    return box;
  });

  //register repo

  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        getIt<DeviceClient>(),
        getIt<NotificationService>(),
        getIt<NetworkClient>(),
        getIt<TokenManager>(),
      ));

  getIt.registerLazySingleton<AuthService>(() => AuthService());

/*  getIt.registerLazySingleton<NotificationPermissionService>(
    () => NotificationPermissionService(
      getIt<Box<DynamicNotificationPermissionConfig>>(),
    ),
  );*/

  //register service
  getIt.registerLazySingleton<NetworkClient>(() => NetworkClientRepoImpl(
        getIt<TokenManager>(),
        getIt<DeviceClient>(),
        endpoint: Config.api.graphqlEndpoint,
      ));

  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoRepoImpl(Connectivity()));

  getIt.registerLazySingleton<DeviceClient>(() => DeviceClientImpl());
  getIt.registerLazySingleton<NotificationService>(() => NotificationService());
  getIt.registerLazySingleton<TokenManager>(
      () => TokenManagerImpl(getIt<Box<Auth>>()));

  getIt.registerLazySingleton<UserInfoClientRepo>(() => UserInfoClientImpl(
        getIt<NotificationService>(),
        getIt<NetworkClient>(),
      ));

  // Wait for async registrations to complete
  //await getIt<NotificationPermissionService>().init();

  await getIt.allReady();
}
