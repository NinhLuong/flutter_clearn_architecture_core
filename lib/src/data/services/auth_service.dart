// ThinhNguyen
// 13:58 26/9/24

import 'package:cct_config/cct_config.dart';
import 'package:cct_core/cct_core.dart';
import 'package:cct_core/src/domain/repositories/user_info_client_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  UserInfoEntity? _currentUserInfo;

  bool _isGuest = true;

  UserInfoEntity? get currentUserInfo => _currentUserInfo;

  get userId => _currentUserInfo?.userProfile.id;

  get userName => _currentUserInfo?.userProfile.displayName;

  get isGuest => _isGuest;

  Future<Either<Failure, void>> guestLogin() async {
    var loginRes = await getIt<AuthRepo>().guestLogin();

    var userInfoResult = await getIt<UserInfoClientRepo>().getUserInfo();

    userInfoResult.fold(
      (l) => ToastUtils.showToast(l.message, AppColors.warning500),
      (userInfo) => _currentUserInfo = userInfo,
    );

    _isGuest = false;

    return loginRes;
  }

  Future<Either<Failure, bool>> loginWithFirebase(
    LoginCode loginCode,
    AnalyticsFromSourceEnum fromSource,
  ) async {
    var loginRes =
        await getIt<AuthRepo>().loginWithFirebase(loginCode, fromSource);
    var userInfoResult = await getIt<UserInfoClientRepo>().getUserInfo();

    userInfoResult.fold(
      (l) => ToastUtils.showToast(l.message, AppColors.warning500),
      (userInfo) => _currentUserInfo = userInfo,
    );

    _isGuest = true;

    return loginRes;
  }
}
