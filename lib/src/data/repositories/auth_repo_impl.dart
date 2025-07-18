// ThinhNguyen
// 11:28 16/9/24

import 'package:cct_config/cct_config.dart';
import 'package:cct_core/cct_core.dart';
import 'package:cct_core/src/data/datasources/api/auth_api.dart';
import 'package:cct_core/src/domain/error/login_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final DeviceClient _deviceClient;
  final NotificationService _notificationService;
  final NetworkClient _networkClient;
  final TokenManager _tokenManager;
  late final AuthApi _authApi;

  AuthRepoImpl(
    this._deviceClient,
    this._notificationService,
    this._networkClient,
    this._tokenManager,
  ) {
    _authApi = AuthApi(_networkClient);
  }

  @override
  Future<Either<Failure, bool>> guestLogin() async {
    final deviceUUID = await _deviceClient.getDeviceUUID();
    final deviceName = await _deviceClient.getDeviceIdentifier();

    return deviceUUID.fold(
      (failure) => Left(failure),
      (deviceUUID) => deviceName.fold(
        (failure) => Left(failure),
        (deviceName) async {
          final subscriptionId = _notificationService.subscriptionId;

          final authResult = await _authApi.guestLogin(
            deviceUUID,
            subscriptionId,
            deviceName,
          );

          return authResult.fold(
            (failure) => Left(failure),
            (auth) async {
              await _tokenManager.saveAuthInfo(auth);
              return const Right(true);
            },
          );
        },
      ),
    );
  }

  @override
  Future<Either<Failure, bool>> loginWithFirebase(
    LoginCode loginCode,
    AnalyticsFromSourceEnum fromSource,
  ) async {
    try {
      late Either<Failure, UserCredential> result;
      switch (loginCode) {
        case LoginCode.facebook:
          result = await _authApi.loginWithFacebook();
          break;
        case LoginCode.google:
          result = await _authApi.loginWithGoogle();
          break;
        case LoginCode.apple:
          result = await _authApi.loginWithApple();
          break;
      }

      return result.fold(
        (failure) => Left(failure),
        (userCredential) {
          return _checkFirebaseAccount(userCredential, fromSource);
        },
      );
    } catch (e) {
      return Left(LoginFailure('Login failed: ${e.toString()}'));
    }
  }

  Future<Either<Failure, bool>> _checkFirebaseAccount(
      UserCredential userCredential, AnalyticsFromSourceEnum fromSource) async {
    if (userCredential.additionalUserInfo == null) {
      return const Right(false);
    }

    final firebaseIdToken = await userCredential.user?.getIdToken();
    if (firebaseIdToken == null) {
      return const Right(false);
    }

    if (userCredential.additionalUserInfo!.isNewUser) {
      // AnalyticUtils.reportSignUp(code.name, fromSource);
    } else {
      // AnalyticUtils.reportLogin(code.name, fromSource);
    }

    final deviceUUID = await _deviceClient.getDeviceUUID();
    final deviceName = await _deviceClient.getDeviceIdentifier();

    return deviceUUID.fold(
      (failure) => Left(failure),
      (deviceUUID) => deviceName.fold(
        (failure) => Left(failure),
        (deviceName) async {
          final subscriptionId = _notificationService.subscriptionId;

          final authResult = await _authApi.loginWithFirebaseToken(
            deviceUUID,
            firebaseIdToken,
            userCredential.user!.uid,
            subscriptionId,
            deviceName,
          );

          return authResult.fold(
            (failure) => Left(failure),
            (auth) async {
              await _tokenManager.saveAuthInfo(auth);
              return const Right(true);
            },
          );
        },
      ),
    );
  }
}
