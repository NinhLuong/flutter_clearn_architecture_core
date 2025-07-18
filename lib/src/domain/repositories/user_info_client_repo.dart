// ThinhNguyen
// 11:43 25/9/24

import 'package:cct_core/cct_core.dart';
import 'package:dartz/dartz.dart';

abstract class UserInfoClientRepo {
  Future<Either<Failure, UserInfoEntity>> getUserInfo();
}
