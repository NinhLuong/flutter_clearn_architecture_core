// ThinhNguyen
// 09:38 24/9/24

import 'package:cct_core/cct_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  factory UserProfile({
    @Default(-1) int id,
    @Default("Chưa Đặt Tên") String displayName,
    DateTime? dateOfBirth,
    @AttachmentOrNullConverter() Attachment? imgUrl,
    @Default("") String email,
    @Default("") String phoneNumber,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
