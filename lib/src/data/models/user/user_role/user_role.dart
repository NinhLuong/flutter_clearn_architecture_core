// ThinhNguyen
// 10:07 24/9/24

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role.freezed.dart';
part 'user_role.g.dart';

@freezed
abstract class UserRole with _$UserRole {
  const factory UserRole({
    required int id,
    required String name,
  }) = _UserRole;

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$UserRoleFromJson(json);
}
