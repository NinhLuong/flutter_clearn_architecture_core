// ThinhNguyen
// 11:04 16/9/24

import 'package:cct_core/src/domain/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NetworkInfo {
  Future<Either<Failure, bool>> get isConnected;
}

class ConnectivityCheckFailure extends Failure {
  const ConnectivityCheckFailure(super.message, [super.error]);
}