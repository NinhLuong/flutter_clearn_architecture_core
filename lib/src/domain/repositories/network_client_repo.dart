// ThinhNguyen
// 10:38 16/9/24

import 'package:cct_core/src/domain/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NetworkClient {
  Future<Either<Failure, Map<String, dynamic>>> sendRequest(
    String requestBody,
    Map<String, dynamic> variables,
  );

  Future<Either<Failure, void>> refreshToken();
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message, [super.error]);
}

class AuthorizationFailure extends Failure {
  const AuthorizationFailure(super.message, [super.error]);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message, [super.error]);
}
