// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_child_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserChildProfile _$UserChildProfileFromJson(Map<String, dynamic> json) {
  return _UserChildProfile.fromJson(json);
}

/// @nodoc
mixin _$UserChildProfile {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  DateTime get dateOfBirth => throw _privateConstructorUsedError;

  /// Serializes this UserChildProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserChildProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserChildProfileCopyWith<UserChildProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserChildProfileCopyWith<$Res> {
  factory $UserChildProfileCopyWith(
          UserChildProfile value, $Res Function(UserChildProfile) then) =
      _$UserChildProfileCopyWithImpl<$Res, UserChildProfile>;
  @useResult
  $Res call({int? id, String name, int gender, DateTime dateOfBirth});
}

/// @nodoc
class _$UserChildProfileCopyWithImpl<$Res, $Val extends UserChildProfile>
    implements $UserChildProfileCopyWith<$Res> {
  _$UserChildProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserChildProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? gender = null,
    Object? dateOfBirth = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserChildProfileImplCopyWith<$Res>
    implements $UserChildProfileCopyWith<$Res> {
  factory _$$UserChildProfileImplCopyWith(_$UserChildProfileImpl value,
          $Res Function(_$UserChildProfileImpl) then) =
      __$$UserChildProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String name, int gender, DateTime dateOfBirth});
}

/// @nodoc
class __$$UserChildProfileImplCopyWithImpl<$Res>
    extends _$UserChildProfileCopyWithImpl<$Res, _$UserChildProfileImpl>
    implements _$$UserChildProfileImplCopyWith<$Res> {
  __$$UserChildProfileImplCopyWithImpl(_$UserChildProfileImpl _value,
      $Res Function(_$UserChildProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserChildProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? gender = null,
    Object? dateOfBirth = null,
  }) {
    return _then(_$UserChildProfileImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserChildProfileImpl implements _UserChildProfile {
  const _$UserChildProfileImpl(
      {required this.id,
      required this.name,
      required this.gender,
      required this.dateOfBirth});

  factory _$UserChildProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserChildProfileImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final int gender;
  @override
  final DateTime dateOfBirth;

  @override
  String toString() {
    return 'UserChildProfile(id: $id, name: $name, gender: $gender, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserChildProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, gender, dateOfBirth);

  /// Create a copy of UserChildProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserChildProfileImplCopyWith<_$UserChildProfileImpl> get copyWith =>
      __$$UserChildProfileImplCopyWithImpl<_$UserChildProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserChildProfileImplToJson(
      this,
    );
  }
}

abstract class _UserChildProfile implements UserChildProfile {
  const factory _UserChildProfile(
      {required final int? id,
      required final String name,
      required final int gender,
      required final DateTime dateOfBirth}) = _$UserChildProfileImpl;

  factory _UserChildProfile.fromJson(Map<String, dynamic> json) =
      _$UserChildProfileImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  int get gender;
  @override
  DateTime get dateOfBirth;

  /// Create a copy of UserChildProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserChildProfileImplCopyWith<_$UserChildProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
