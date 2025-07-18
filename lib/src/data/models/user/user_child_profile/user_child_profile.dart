// ThinhNguyen
// 13:49 25/9/24

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_child_profile.freezed.dart';

part 'user_child_profile.g.dart';

@freezed
abstract class UserChildProfile with _$UserChildProfile {
  const factory UserChildProfile({
    required int? id,
    required String name,
    required int gender,
    required DateTime dateOfBirth,
  }) = _UserChildProfile;

  factory UserChildProfile.fromJson(Map<String, dynamic> json) =>
      _$UserChildProfileFromJson(json);
}
