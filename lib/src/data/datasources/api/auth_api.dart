// ThinhNguyen
// 15:22 16/9/24

import 'dart:io';

import 'package:cct_core/src/data/graphql_query_strings/auth_string_query.dart';
import 'package:cct_core/src/data/mappers/auth_mapper.dart';
import 'package:cct_core/src/domain/entities/auth/auth_entity.dart';
import 'package:cct_core/src/domain/error/failures.dart';
import 'package:cct_core/src/domain/error/login_failures.dart';
import 'package:cct_core/src/domain/repositories/network_client_repo.dart';
import 'package:cct_core/src/utils/common_utils/string_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthApi {
  final NetworkClient networkClient;

  AuthApi(this.networkClient);

  Future<Either<Failure, UserCredential>> loginWithApple() async {
    final rawNonce = generateNonce();
    final nonce = rawNonce.sha256ofString();

    late UserCredential userCredential;

    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final credential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
        rawNonce: rawNonce,
      );

      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return Right(userCredential);
    } catch (e) {
      return Left(LoginWithAppleFailure('Login with apple failed', e));
    }
  }

  Future<Either<Failure, UserCredential>> loginWithFacebook() async {
    await FacebookAuth.instance.logOut();

    late UserCredential userCredential;
    try {
      final OAuthCredential facebookAuthCredential;

      final rawNonce = generateNonce();
      final nonce = rawNonce.sha256ofString();
      final result = await FacebookAuth.instance
          .login(nonce: nonce, loginBehavior: LoginBehavior.nativeWithFallback);

      final accessToken = result.accessToken;
      if (accessToken == null) {
        throw Exception('Login cancelled');
      }

      if (accessToken.type == AccessTokenType.limited) {
        facebookAuthCredential = OAuthProvider('facebook.com').credential(
          idToken: accessToken.tokenString,
          rawNonce: rawNonce,
        );
      } else {
        facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.tokenString);
      }

      userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      return Right(userCredential);
    } catch (e) {
      return Left(LoginWithFacebookFailure('Login with apple failed', e));
    }
  }

  Future<Either<Failure, UserCredential>> loginWithGoogle() async {
    late UserCredential userCredential;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return Right(userCredential);
      } else {
        return Left(
          LoginWithGoogleFailure(
              'Login with google failed (google User is null)', googleUser),
        );
      }
    } catch (e) {
      return Left(LoginWithGoogleFailure('Login with google failed', e));
    }
  }

  Future<Either<Failure, AuthEntity>> guestLogin(
    String deviceUUID,
    String subscriptionId,
    String deviceName,
  ) async {
    Map<String, dynamic> variables = {
      "uuid": deviceUUID,
      "deviceName": deviceName,
      "deviceType": Platform.isIOS ? 1 : 2,
      "subscriptionId": subscriptionId,
    };

    var res = await networkClient.sendRequest(
      AuthStringQuery.guestLogin,
      variables,
    );

    return res.fold(
      (l) => Left(l),
      (r) => Right(AuthMapper.fromJson(r["createUserBeforeLogin"]["data"])),
    );
  }

  Future<Either<Failure, AuthEntity>> loginWithFirebaseToken(
    String deviceUUID,
    String firebaseIdToken,
    String userId,
    String subscriptionId,
    String deviceName,
  ) async {
    Map<String, dynamic> variables = {
      "idToken": firebaseIdToken,
      "uuid": deviceUUID,
      "uid": userId,
      "deviceName": deviceName,
      "deviceType": Platform.isIOS ? 1 : 2,
      "subscriptionId": subscriptionId
    };

    var res = await networkClient.sendRequest(
      AuthStringQuery.checkFireBaseAccount,
      variables,
    );

    return res.fold(
      (l) => Left(l),
      (r) => Right(AuthMapper.fromJson(r["checkFireBaseAccount"]["data"])),
    );
  }
}
