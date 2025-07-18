// ThinhNguyen
// 14:52 16/9/24

import 'package:cct_core/src/domain/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class DeviceClient {
  Future<Either<Failure, String>> getDeviceUUID();
  Future<Either<Failure, String>> getDeviceIdentifier();
}

class DeviceFailure extends Failure {
  const DeviceFailure(super.message, [super.error]);
}