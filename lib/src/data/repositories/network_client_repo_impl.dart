// ThinhNguyen
// 10:43 16/9/24

import 'dart:async';

import 'package:cct_core/cct_core.dart';
import 'package:cct_core/src/data/graphql_query_strings/auth_string_query.dart';
import 'package:cct_core/src/data/mappers/auth_mapper.dart';
import 'package:cct_core/src/domain/entities/auth/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class NetworkClientRepoImpl implements NetworkClient {
  final String endpoint;
  final TokenManager tokenManager;
  final DeviceClient deviceClient;

  late final NormalHttpLink normalHttpLink;
  late final GraphQLClient normalClient;

  Completer<void> _refreshCompleter = Completer<void>();
  bool _isRefreshing = false;

  NetworkClientRepoImpl(this.tokenManager, this.deviceClient,
      {required this.endpoint})
      : normalHttpLink = NormalHttpLink(endpoint, tokenManager, deviceClient) {
    _initialize();
  }

  void _initialize() {
    normalClient = GraphQLClient(
      cache: GraphQLCache(),
      link: normalHttpLink,
      defaultPolicies: DefaultPolicies(
        mutate: Policies(fetch: FetchPolicy.noCache),
        query: Policies(fetch: FetchPolicy.noCache),
      ),
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> sendRequest(
    String requestBody,
    Map<String, dynamic> variables,
  ) async {
    final QueryOptions options = QueryOptions(
      document: gql(requestBody),
      variables: variables,
    );

    try {
      QueryResult result = await normalClient
          .query(options)
          .timeout(const Duration(seconds: 15));

      if (_isAuthorizationError(result)) {
        final refreshResult = await refreshToken();
        if (refreshResult.isLeft()) {
          return const Left(AuthorizationFailure('Token refresh failed'));
        }
        result = await normalClient
            .query(options)
            .timeout(const Duration(seconds: 15));
      }

      if (result.hasException) {
        return Left(NetworkFailure(result.exception.toString()));
      }

      if (result.data == null) {
        return const Left(NetworkFailure("Data null"));
      }

      return Right(result.data!);
    } on TimeoutException {
      return const Left(TimeoutFailure('Request timed out'));
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }

  bool _isAuthorizationError(QueryResult result) {
    return result.hasException &&
        result.exception?.graphqlErrors.isNotEmpty == true &&
        result.exception!.graphqlErrors.first.message == "Not Authorised!";
  }

  @override
  Future<Either<Failure, AuthEntity?>> refreshToken() async {
    if (_isRefreshing) {
      await _refreshCompleter.future;
      return tokenManager.getAuthInfo();
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<void>();

    try {
      final refreshTokenResult = await tokenManager.getRefreshToken();

      return await refreshTokenResult.fold((failure) async {
        // If we can't get the refresh token, we can't refresh
        await _handleRefreshFailure();
        return Left(AuthorizationFailure(
            'Failed to get refresh token: ${failure.message}'));
      }, (refreshToken) async {
        final result = await normalClient.mutate(MutationOptions(
          document: gql(AuthStringQuery.refreshAuthInfo),
          variables: {"refreshToken": refreshToken},
        ));

        if (result.hasException) {
          throw Exception(result.exception.toString());
        }

        final tokens = result.data!["refreshUserToken"] as Map<String, dynamic>;
        final newAuth = AuthMapper.fromJson(tokens);

        await tokenManager.saveAuthInfo(newAuth);

        _isRefreshing = false;
        _refreshCompleter.complete();
        return Right(newAuth);
      });
    } catch (e) {
      await _handleRefreshFailure();
      return Left(
          AuthorizationFailure('Failed to refresh token: ${e.toString()}'));
    }
  }

  Future<void> _handleRefreshFailure() async {
    await _forceGuestLogin();
    _isRefreshing = false;
    _refreshCompleter.completeError("Failed to refresh token");
  }

  Future<void> _forceGuestLogin() async {
    /*await AuthSingleton().authUserCubit().logout();
    await AuthSingleton().authUserCubit().guestLogin();*/
  }
}
