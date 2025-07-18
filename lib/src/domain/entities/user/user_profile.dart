// ThinhNguyen
// 14:23 24/9/24

import 'package:cct_core/src/domain/entities/attachment/attachment_entity.dart';

class UserProfileEntity {
  final int id;
  final String displayName;
  final DateTime? dateOfBirth;
  final AttachmentEntity? imgUrl;
  final String email;
  final String phoneNumber;

  const UserProfileEntity({
    this.id = -1,
    this.displayName = "Chưa Đặt Tên",
    this.dateOfBirth,
    this.imgUrl,
    this.email = "",
    this.phoneNumber = "",
  });

  UserProfileEntity copyWith({
    int? id,
    String? displayName,
    DateTime? dateOfBirth,
    AttachmentEntity? imgUrl,
    String? email,
    String? phoneNumber,
  }) {
    return UserProfileEntity(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      imgUrl: imgUrl ?? this.imgUrl,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
