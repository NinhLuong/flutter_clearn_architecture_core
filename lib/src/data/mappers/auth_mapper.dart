// ThinhNguyen
// 11:31 16/9/24

import 'package:cct_core/src/data/models/auth/auth.dart';
import 'package:cct_core/src/domain/entities/auth/auth_entity.dart';

class AuthMapper {
  static AuthEntity toEntity(Auth model) {
    return AuthEntity(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }

  static Auth fromEntity(AuthEntity entity) {
    return Auth(
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
    );
  }

  static AuthEntity fromJson(Map<String, dynamic> json) {
    return AuthEntity(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  static Map<String, dynamic> toJson(AuthEntity entity) {
    return {
      'accessToken': entity.accessToken,
      'refreshToken': entity.refreshToken,
    };
  }
}