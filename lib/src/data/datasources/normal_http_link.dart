// ThinhNguyen
// 11:09 16/9/24

import 'dart:io';

import 'package:cct_core/cct_core.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class NormalHttpLink extends HttpLink {
  final TokenManager tokenManager;
  final DeviceClient deviceClient;

  NormalHttpLink(super.uri, this.tokenManager, this.deviceClient);

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    try {
      final uuidResult = await deviceClient.getDeviceUUID();
      final String uuid = await uuidResult.fold(
        (failure) async {
          if (kDebugMode) {
            print('Failed to get UUID: ${failure.message}');
          }
          throw ContextReadException(
            originalException: failure,
            originalStackTrace: StackTrace.current,
          );
        },
        (value) async => value,
      );

      final accessTokenResult = await tokenManager.getAccessToken();
      final String accessToken = await accessTokenResult.fold(
        (failure) async {
          if (kDebugMode) {
            print('Failed to get access token: ${failure.message}');
          }
          throw ContextReadException(
            originalException: failure,
            originalStackTrace: StackTrace.current,
          );
        },
        (value) async => value,
      );

      // Only proceed if we have both UUID and access token
      HttpLinkHeaders linkHeaders = HttpLinkHeaders(
        headers: {
          'uuid': uuid,
          'authorization': accessToken,
          'platform': 'userApp',
          "deviceName": Platform.isIOS ? "IOS" : "Android",
          "Keep-Alive": "timeout = 5, max = 1000",
        },
      );

      request = request.withContextEntry(linkHeaders);
      yield* super.request(request);
    } catch (e, stackTrace) {
      throw ContextReadException(
        originalException: e,
        originalStackTrace: stackTrace,
      );
    }
  }
}
