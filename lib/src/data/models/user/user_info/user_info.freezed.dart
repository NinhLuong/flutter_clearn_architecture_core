// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  UserProfile get userProfile => throw _privateConstructorUsedError;
  List<UserRole> get userRoles => throw _privateConstructorUsedError;
  List<UserChildProfile> get childProfiles =>
      throw _privateConstructorUsedError;

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {UserProfile userProfile,
      List<UserRole> userRoles,
      List<UserChildProfile> childProfiles});

  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
    Object? userRoles = null,
    Object? childProfiles = null,
  }) {
    return _then(_value.copyWith(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      userRoles: null == userRoles
          ? _value.userRoles
          : userRoles // ignore: cast_nullable_to_non_nullable
              as List<UserRole>,
      childProfiles: null == childProfiles
          ? _value.childProfiles
          : childProfiles // ignore: cast_nullable_to_non_nullable
              as List<UserChildProfile>,
    ) as $Val);
  }

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get userProfile {
    return $UserProfileCopyWith<$Res>(_value.userProfile, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserProfile userProfile,
      List<UserRole> userRoles,
      List<UserChildProfile> childProfiles});

  @override
  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
    Object? userRoles = null,
    Object? childProfiles = null,
  }) {
    return _then(_$UserInfoImpl(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      userRoles: null == userRoles
          ? _value._userRoles
          : userRoles // ignore: cast_nullable_to_non_nullable
              as List<UserRole>,
      childProfiles: null == childProfiles
          ? _value._childProfiles
          : childProfiles // ignore: cast_nullable_to_non_nullable
              as List<UserChildProfile>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {required this.userProfile,
      final List<UserRole> userRoles = const [],
      final List<UserChildProfile> childProfiles = const []})
      : _userRoles = userRoles,
        _childProfiles = childProfiles;

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final UserProfile userProfile;
  final List<UserRole> _userRoles;
  @override
  @JsonKey()
  List<UserRole> get userRoles {
    if (_userRoles is EqualUnmodifiableListView) return _userRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userRoles);
  }

  final List<UserChildProfile> _childProfiles;
  @override
  @JsonKey()
  List<UserChildProfile> get childProfiles {
    if (_childProfiles is EqualUnmodifiableListView) return _childProfiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_childProfiles);
  }

  @override
  String toString() {
    return 'UserInfo(userProfile: $userProfile, userRoles: $userRoles, childProfiles: $childProfiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            const DeepCollectionEquality()
                .equals(other._userRoles, _userRoles) &&
            const DeepCollectionEquality()
                .equals(other._childProfiles, _childProfiles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userProfile,
      const DeepCollectionEquality().hash(_userRoles),
      const DeepCollectionEquality().hash(_childProfiles));

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {required final UserProfile userProfile,
      final List<UserRole> userRoles,
      final List<UserChildProfile> childProfiles}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  UserProfile get userProfile;
  @override
  List<UserRole> get userRoles;
  @override
  List<UserChildProfile> get childProfiles;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
