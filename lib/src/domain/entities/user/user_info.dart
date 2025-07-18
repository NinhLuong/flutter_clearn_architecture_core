// ThinhNguyen
// 14:23 24/9/24

import 'package:cct_core/src/domain/entities/user/user_child_profile.dart';
import 'package:cct_core/src/domain/entities/user/user_profile.dart';
import 'package:cct_core/src/domain/entities/user/user_role.dart';

class UserInfoEntity {
  final UserProfileEntity userProfile;
  final List<UserChildProfileEntity> childProfiles;
  final List<UserRoleEntity> userRoles;

  const UserInfoEntity({
    required this.userProfile,
    required this.childProfiles,
    required this.userRoles,
  });

  UserInfoEntity copyWith({
    UserProfileEntity? userProfile,
    List<UserChildProfileEntity>? childProfiles,
    List<UserRoleEntity>? userRoles,
  }) {
    return UserInfoEntity(
      userProfile: userProfile ?? this.userProfile,
      childProfiles: childProfiles ?? this.childProfiles,
      userRoles: userRoles ?? this.userRoles,
    );
  }
}
