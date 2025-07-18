// ThinhNguyen
// 11:27 16/9/24

class AuthEntity {
  final String accessToken;
  final String refreshToken;

  const AuthEntity({
    required this.accessToken,
    required this.refreshToken,
  });

  // Equality and toString methods
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthEntity &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken &&
          refreshToken == other.refreshToken;

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;

  @override
  String toString() =>
      'AuthEntity(accessToken: $accessToken, refreshToken: $refreshToken)';
}
