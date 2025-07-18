// ThinhNguyen
// 15:00 17/9/24

import 'package:cct_core/src/domain/entities/auth/auth_entity.dart';
import 'package:cct_core/src/domain/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class TokenManager {
  Future<Either<Failure, String>> getAccessToken();

  Future<Either<Failure, String>> getRefreshToken();

  Future<Either<Failure, void>> saveAuthInfo(AuthEntity auth);

  Future<Either<Failure, void>> clearAuthInfo();

  Future<Either<Failure, AuthEntity?>> getAuthInfo();
}
