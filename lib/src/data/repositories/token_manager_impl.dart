// ThinhNguyen
// 15:01 17/9/24

import 'package:cct_core/src/data/datasources/local/auth_local.dart';
import 'package:cct_core/src/data/models/auth/auth.dart';
import 'package:cct_core/src/domain/entities/auth/auth_entity.dart';
import 'package:cct_core/src/domain/error/failures.dart';
import 'package:cct_core/src/domain/repositories/token_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

class TokenManagerImpl implements TokenManager {
  final AuthLocal _authLocal;

  TokenManagerImpl(Box<Auth> authBox) : _authLocal = AuthLocal(authBox);


  @override
  Future<Either<Failure, AuthEntity>> getAuthInfo() => _authLocal.getAuthInfo();

  @override
  Future<Either<Failure, void>> saveAuthInfo(AuthEntity authEntity) =>
      _authLocal.saveAuthInfo(authEntity);

  @override
  Future<Either<Failure, void>> clearAuthInfo() => _authLocal.clearAuthInfo();

  @override
  Future<Either<Failure, String>> getRefreshToken() =>
      _authLocal.getRefreshToken();

  @override
  Future<Either<Failure, String>> getAccessToken() =>
      _authLocal.getAccessToken();
}