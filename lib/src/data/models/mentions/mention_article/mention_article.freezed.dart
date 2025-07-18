// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mention_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MentionArticle _$MentionArticleFromJson(Map<String, dynamic> json) {
  return _MentionArticle.fromJson(json);
}

/// @nodoc
mixin _$MentionArticle {
  int get id => throw _privateConstructorUsedError;
  @AttachmentListConverter()
  List<Attachment> get imgUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this MentionArticle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MentionArticle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MentionArticleCopyWith<MentionArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MentionArticleCopyWith<$Res> {
  factory $MentionArticleCopyWith(
          MentionArticle value, $Res Function(MentionArticle) then) =
      _$MentionArticleCopyWithImpl<$Res, MentionArticle>;
  @useResult
  $Res call(
      {int id,
      @AttachmentListConverter() List<Attachment> imgUrl,
      String title});
}

/// @nodoc
class _$MentionArticleCopyWithImpl<$Res, $Val extends MentionArticle>
    implements $MentionArticleCopyWith<$Res> {
  _$MentionArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MentionArticle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imgUrl = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MentionArticleImplCopyWith<$Res>
    implements $MentionArticleCopyWith<$Res> {
  factory _$$MentionArticleImplCopyWith(_$MentionArticleImpl value,
          $Res Function(_$MentionArticleImpl) then) =
      __$$MentionArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @AttachmentListConverter() List<Attachment> imgUrl,
      String title});
}

/// @nodoc
class __$$MentionArticleImplCopyWithImpl<$Res>
    extends _$MentionArticleCopyWithImpl<$Res, _$MentionArticleImpl>
    implements _$$MentionArticleImplCopyWith<$Res> {
  __$$MentionArticleImplCopyWithImpl(
      _$MentionArticleImpl _value, $Res Function(_$MentionArticleImpl) _then)
      : super(_value, _then);

  /// Create a copy of MentionArticle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imgUrl = null,
    Object? title = null,
  }) {
    return _then(_$MentionArticleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imgUrl: null == imgUrl
          ? _value._imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MentionArticleImpl implements _MentionArticle {
  const _$MentionArticleImpl(
      {required this.id,
      @AttachmentListConverter() final List<Attachment> imgUrl = const [],
      required this.title})
      : _imgUrl = imgUrl;

  factory _$MentionArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$MentionArticleImplFromJson(json);

  @override
  final int id;
  final List<Attachment> _imgUrl;
  @override
  @JsonKey()
  @AttachmentListConverter()
  List<Attachment> get imgUrl {
    if (_imgUrl is EqualUnmodifiableListView) return _imgUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgUrl);
  }

  @override
  final String title;

  @override
  String toString() {
    return 'MentionArticle(id: $id, imgUrl: $imgUrl, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MentionArticleImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._imgUrl, _imgUrl) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_imgUrl), title);

  /// Create a copy of MentionArticle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MentionArticleImplCopyWith<_$MentionArticleImpl> get copyWith =>
      __$$MentionArticleImplCopyWithImpl<_$MentionArticleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MentionArticleImplToJson(
      this,
    );
  }
}

abstract class _MentionArticle implements MentionArticle {
  const factory _MentionArticle(
      {required final int id,
      @AttachmentListConverter() final List<Attachment> imgUrl,
      required final String title}) = _$MentionArticleImpl;

  factory _MentionArticle.fromJson(Map<String, dynamic> json) =
      _$MentionArticleImpl.fromJson;

  @override
  int get id;
  @override
  @AttachmentListConverter()
  List<Attachment> get imgUrl;
  @override
  String get title;

  /// Create a copy of MentionArticle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MentionArticleImplCopyWith<_$MentionArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
