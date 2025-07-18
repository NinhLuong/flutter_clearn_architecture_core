// ThinhNguyen
// 11:06 16/9/24

import 'package:cct_core/src/domain/error/failures.dart';
import 'package:cct_core/src/domain/repositories/network_info_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class NetworkInfoRepoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoRepoImpl(this.connectivity);

  @override
  Future<Either<Failure, bool>> get isConnected async {
    try {
      final connectivityResult = await connectivity.checkConnectivity();
      return Right(!connectivityResult.contains(ConnectivityResult.none));
    } catch (e) {
      return Left(ConnectivityCheckFailure(
          'Failed to check connectivity: ${e.toString()}'));
    }
  }
}
