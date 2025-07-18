// ThinhNguyen
// 14:57 16/9/24

import 'dart:io';

import 'package:cct_core/src/domain/error/failures.dart';
import 'package:cct_core/src/domain/repositories/device_client_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class DeviceClientImpl extends DeviceClient {
  @override
  Future<Either<Failure, String>> getDeviceUUID() async {
    String uuid = await loadUUID();
    if (uuid.isEmpty) {
      uuid = const Uuid().v4();
      await saveUUID(uuid);
    }
    return Right(uuid);
  }

  Future<void> saveUUID(String uuid) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "uuid", value: uuid);
  }

  Future<String> loadUUID() async {
    const storage = FlutterSecureStorage();
    String uuid = await storage.read(key: 'uuid') ?? "";
    return uuid;
  }

  @override
  Future<Either<Failure, String>> getDeviceIdentifier() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      late String deviceIdentifier;

      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceIdentifier = '${androidInfo.manufacturer} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceIdentifier = iosInfo.utsname.machine;
      } else {
        return const Left(
          DeviceFailure('Unsupported platform'),
        );
      }

      if (deviceIdentifier.isEmpty) {
        return const Left(
          DeviceFailure('Unable to retrieve device identifier'),
        );
      }

      return Right(deviceIdentifier);
    } catch (e) {
      return Left(
        DeviceFailure('Error getting device identifier: ${e.toString()}'),
      );
    }
  }
}
