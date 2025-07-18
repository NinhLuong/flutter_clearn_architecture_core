// ThinhNguyen
// 11:50 25/9/24

import 'package:cct_core/src/data/graphql_query_strings/user_string_query.dart';
import 'package:cct_core/src/data/models/user/user_info/user_info.dart';
import 'package:cct_core/src/domain/error/failures.dart';
import 'package:cct_core/src/domain/repositories/network_client_repo.dart';
import 'package:dartz/dartz.dart';

class UserApi {
  final NetworkClient networkClient;

  UserApi(this.networkClient);

  Future<Either<Failure, UserInfo>> fetchUserInfo(String subscriptionId) async {
    var body = UserStringQuery.fetchUserInfo;

    Map<String, dynamic> variables = {"subscriptionId": subscriptionId};

    var res = await networkClient.sendRequest(body, variables);

    _triggerServerLoadOneSignalUserInfo(subscriptionId);

    return res.fold(
      (l) => Left(l),
      (r) {
        UserInfo userInfo = UserInfo.fromJson(r["findMyUserInfo"]["user"]);
        return Right(userInfo);
      },
    );
  }

  Future<void> _triggerServerLoadOneSignalUserInfo(
      String subscriptionId) async {
    var body = UserStringQuery.loadOneSignalUserInfo;

    Map<String, dynamic> variables = {"subscriptionId": subscriptionId};

    await networkClient.sendRequest(body, variables);
  }
}
