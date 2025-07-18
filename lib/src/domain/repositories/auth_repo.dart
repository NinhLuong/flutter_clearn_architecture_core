// ThinhNguyen
// 11:23 16/9/24

import 'package:cct_config/cct_config.dart';
import 'package:cct_core/src/domain/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> loginWithFirebase(
    LoginCode loginCode,
    AnalyticsFromSourceEnum fromSource,
  );

  Future<Either<Failure, void>> guestLogin();
}
