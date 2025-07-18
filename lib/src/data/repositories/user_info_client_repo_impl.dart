// ThinhNguyen
// 11:49 25/9/24

import 'package:cct_core/cct_core.dart';
import 'package:cct_core/src/data/datasources/api/user_api.dart';
import 'package:cct_core/src/data/mappers/user_info_mapper.dart';
import 'package:cct_core/src/domain/repositories/user_info_client_repo.dart';
import 'package:dartz/dartz.dart';

class UserInfoClientImpl implements UserInfoClientRepo {
  final NotificationService _notificationService;
  final NetworkClient _networkClient;
  late final UserApi _userApi;

  UserInfoClientImpl(this._notificationService, this._networkClient) {
    _userApi = UserApi(_networkClient);
  }

  @override
  Future<Either<Failure, UserInfoEntity>> getUserInfo() async {
    final subscriptionId = _notificationService.subscriptionId;

    final authResult = await _userApi.fetchUserInfo(subscriptionId);

    return authResult.fold(
      (failure) => Left(failure),
      (userInfo) => Right(UserInfoMapper.fromModel(userInfo)),
    );
  }
}
