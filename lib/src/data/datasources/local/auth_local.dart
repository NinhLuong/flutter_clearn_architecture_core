// ThinhNguyen
// 15:22 16/9/24

import 'package:cct_core/src/data/mappers/auth_mapper.dart';
import 'package:cct_core/src/data/models/auth/auth.dart';
import 'package:cct_core/src/domain/entities/auth/auth_entity.dart';
import 'package:cct_core/src/domain/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

class AuthLocal {
  final Box<Auth> _authBox;

  AuthLocal(this._authBox);

  Future<Either<Failure, AuthEntity>> getAuthInfo() async {
    try {
      final auth = _authBox.get('auth');
      return auth != null
          ? Right(AuthMapper.toEntity(auth))
          : const Left(CacheFailure('Auth not found'));
    } catch (e) {
      return Left(CacheFailure('Failed to get auth info: ${e.toString()}'));
    }
  }

  Future<Either<Failure, void>> saveAuthInfo(AuthEntity authEntity) async {
    try {
      await _authBox.put('auth', AuthMapper.fromEntity(authEntity));
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to save auth info: ${e.toString()}'));
    }
  }

  Future<Either<Failure, void>> clearAuthInfo() async {
    try {
      await _authBox.delete('auth');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear auth info: ${e.toString()}'));
    }
  }

  Future<Either<Failure, String>> getRefreshToken() async {
    try {
      final auth = _authBox.get('auth');
      return Right(auth?.refreshToken ?? "no_refresh_token_found");
    } catch (e) {
      return Left(CacheFailure('Failed to get refresh token: ${e.toString()}'));
    }
  }

  Future<Either<Failure, String>> getAccessToken() async {
    try {
      final auth = _authBox.get('auth');
      return Right(auth?.accessToken ?? "no_access_token_found");
    } catch (e) {
      return Left(CacheFailure('Failed to get access token: ${e.toString()}'));
    }
  }
}