// ThinhNguyen
// 14:35 25/9/24

import 'package:cct_core/cct_core.dart';
import 'package:cct_core/src/data/models/user/user_child_profile/user_child_profile.dart';
import 'package:cct_core/src/domain/entities/user/user_child_profile.dart';
import 'package:cct_core/src/domain/entities/user/user_profile.dart';
import 'package:cct_core/src/domain/entities/user/user_role.dart';

class UserChildProfileMapper {
  static UserChildProfileEntity fromModel(UserChildProfile model) {
    return UserChildProfileEntity(
      id: model.id,
      name: model.name,
      gender: model.gender,
      dateOfBirth: model.dateOfBirth,
    );
  }

  static UserChildProfile toModel(UserChildProfileEntity entity) {
    return UserChildProfile(
      id: entity.id,
      name: entity.name,
      gender: entity.gender,
      dateOfBirth: entity.dateOfBirth,
    );
  }

  static List<UserChildProfileEntity> fromModelList(
      List<UserChildProfile> models) {
    return models.map((model) => fromModel(model)).toList();
  }

  static List<UserChildProfile> toModelList(
      List<UserChildProfileEntity> entities) {
    return entities.map((entity) => toModel(entity)).toList();
  }
}

class UserRoleMapper {
  static UserRoleEntity fromModel(UserRole model) {
    return UserRoleEntity(
      id: model.id,
      name: model.name,
    );
  }

  static UserRole toModel(UserRoleEntity entity) {
    return UserRole(
      id: entity.id,
      name: entity.name,
    );
  }

  static List<UserRoleEntity> fromModelList(List<UserRole> models) {
    return models.map((model) => fromModel(model)).toList();
  }

  static List<UserRole> toModelList(List<UserRoleEntity> entities) {
    return entities.map((entity) => toModel(entity)).toList();
  }
}

class UserProfileMapper {
  static UserProfileEntity fromModel(UserProfile model) {
    return UserProfileEntity(
      id: model.id,
      displayName: model.displayName,
      dateOfBirth: model.dateOfBirth,
      imgUrl: model.imgUrl != null
          ? AttachmentMapper.modelToEntity(model.imgUrl!)
          : null,
      email: model.email,
      phoneNumber: model.phoneNumber,
    );
  }

  static UserProfile toModel(UserProfileEntity entity) {
    return UserProfile(
      id: entity.id,
      displayName: entity.displayName,
      dateOfBirth: entity.dateOfBirth,
      imgUrl: entity.imgUrl != null
          ? AttachmentMapper.entityToModel(entity.imgUrl!)
          : null,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
    );
  }

  static List<UserProfileEntity> fromModelList(List<UserProfile> models) {
    return models.map((model) => fromModel(model)).toList();
  }

  static List<UserProfile> toModelList(List<UserProfileEntity> entities) {
    return entities.map((entity) => toModel(entity)).toList();
  }
}

class UserInfoMapper {
  static UserInfoEntity fromModel(UserInfo model) {
    return UserInfoEntity(
      userProfile: UserProfileMapper.fromModel(model.userProfile),
      childProfiles: UserChildProfileMapper.fromModelList(model.childProfiles),
      userRoles: UserRoleMapper.fromModelList(model.userRoles),
    );
  }

  static UserInfo toModel(UserInfoEntity entity) {
    return UserInfo(
      userProfile: UserProfileMapper.toModel(entity.userProfile),
      childProfiles: UserChildProfileMapper.toModelList(entity.childProfiles),
      userRoles: UserRoleMapper.toModelList(entity.userRoles),
    );
  }

  static List<UserInfoEntity> fromModelList(List<UserInfo> models) {
    return models.map((model) => fromModel(model)).toList();
  }

  static List<UserInfo> toModelList(List<UserInfoEntity> entities) {
    return entities.map((entity) => toModel(entity)).toList();
  }
}