// ThinhNguyen
// 15:23 16/9/24


import 'failures.dart';

class LoginFailure extends Failure {
  const LoginFailure(super.message, [super.error]);
}

class LoginWithAppleFailure extends Failure {
  const LoginWithAppleFailure(super.message, [super.error]);
}

class LoginWithGoogleFailure extends Failure {
  const LoginWithGoogleFailure(super.message, [super.error]);
}

class LoginWithFacebookFailure extends Failure {
  const LoginWithFacebookFailure(super.message, [super.error]);
}
