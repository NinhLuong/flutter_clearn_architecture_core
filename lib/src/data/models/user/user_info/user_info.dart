// ThinhNguyen
// 10:09 24/9/24


import 'package:cct_core/src/data/models/user/user_child_profile/user_child_profile.dart';
import 'package:cct_core/src/data/models/user/user_profile/user_profile.dart';
import 'package:cct_core/src/data/models/user/user_role/user_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required UserProfile userProfile,
    @Default([]) List<UserRole> userRoles,
    @Default([]) List<UserChildProfile> childProfiles,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
