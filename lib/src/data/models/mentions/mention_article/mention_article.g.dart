// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mention_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MentionArticleImpl _$$MentionArticleImplFromJson(Map<String, dynamic> json) =>
    _$MentionArticleImpl(
      id: (json['id'] as num).toInt(),
      imgUrl: json['imgUrl'] == null
          ? const []
          : const AttachmentListConverter().fromJson(json['imgUrl'] as String),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$MentionArticleImplToJson(
        _$MentionArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgUrl': const AttachmentListConverter().toJson(instance.imgUrl),
      'title': instance.title,
    };
