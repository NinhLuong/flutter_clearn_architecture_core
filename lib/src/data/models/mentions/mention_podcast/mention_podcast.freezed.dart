// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mention_podcast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MentionPodcast _$MentionPodcastFromJson(Map<String, dynamic> json) {
  return _MentionPodcast.fromJson(json);
}

/// @nodoc
mixin _$MentionPodcast {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @AttachmentConverter()
  Attachment get imgUrl => throw _privateConstructorUsedError;

  /// Serializes this MentionPodcast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MentionPodcast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MentionPodcastCopyWith<MentionPodcast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MentionPodcastCopyWith<$Res> {
  factory $MentionPodcastCopyWith(
          MentionPodcast value, $Res Function(MentionPodcast) then) =
      _$MentionPodcastCopyWithImpl<$Res, MentionPodcast>;
  @useResult
  $Res call(
      {int id,
      String title,
      String author,
      String description,
      @AttachmentConverter() Attachment imgUrl});

  $AttachmentCopyWith<$Res> get imgUrl;
}

/// @nodoc
class _$MentionPodcastCopyWithImpl<$Res, $Val extends MentionPodcast>
    implements $MentionPodcastCopyWith<$Res> {
  _$MentionPodcastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MentionPodcast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? description = null,
    Object? imgUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as Attachment,
    ) as $Val);
  }

  /// Create a copy of MentionPodcast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttachmentCopyWith<$Res> get imgUrl {
    return $AttachmentCopyWith<$Res>(_value.imgUrl, (value) {
      return _then(_value.copyWith(imgUrl: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MentionPodcastImplCopyWith<$Res>
    implements $MentionPodcastCopyWith<$Res> {
  factory _$$MentionPodcastImplCopyWith(_$MentionPodcastImpl value,
          $Res Function(_$MentionPodcastImpl) then) =
      __$$MentionPodcastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String author,
      String description,
      @AttachmentConverter() Attachment imgUrl});

  @override
  $AttachmentCopyWith<$Res> get imgUrl;
}

/// @nodoc
class __$$MentionPodcastImplCopyWithImpl<$Res>
    extends _$MentionPodcastCopyWithImpl<$Res, _$MentionPodcastImpl>
    implements _$$MentionPodcastImplCopyWith<$Res> {
  __$$MentionPodcastImplCopyWithImpl(
      _$MentionPodcastImpl _value, $Res Function(_$MentionPodcastImpl) _then)
      : super(_value, _then);

  /// Create a copy of MentionPodcast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? description = null,
    Object? imgUrl = null,
  }) {
    return _then(_$MentionPodcastImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as Attachment,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MentionPodcastImpl implements _MentionPodcast {
  const _$MentionPodcastImpl(
      {required this.id,
      required this.title,
      required this.author,
      this.description = "",
      @AttachmentConverter() required this.imgUrl});

  factory _$MentionPodcastImpl.fromJson(Map<String, dynamic> json) =>
      _$$MentionPodcastImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String author;
  @override
  @JsonKey()
  final String description;
  @override
  @AttachmentConverter()
  final Attachment imgUrl;

  @override
  String toString() {
    return 'MentionPodcast(id: $id, title: $title, author: $author, description: $description, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MentionPodcastImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, author, description, imgUrl);

  /// Create a copy of MentionPodcast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MentionPodcastImplCopyWith<_$MentionPodcastImpl> get copyWith =>
      __$$MentionPodcastImplCopyWithImpl<_$MentionPodcastImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MentionPodcastImplToJson(
      this,
    );
  }
}

abstract class _MentionPodcast implements MentionPodcast {
  const factory _MentionPodcast(
          {required final int id,
          required final String title,
          required final String author,
          final String description,
          @AttachmentConverter() required final Attachment imgUrl}) =
      _$MentionPodcastImpl;

  factory _MentionPodcast.fromJson(Map<String, dynamic> json) =
      _$MentionPodcastImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get author;
  @override
  String get description;
  @override
  @AttachmentConverter()
  Attachment get imgUrl;

  /// Create a copy of MentionPodcast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MentionPodcastImplCopyWith<_$MentionPodcastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
