// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mention_podcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MentionPodcastImpl _$$MentionPodcastImplFromJson(Map<String, dynamic> json) =>
    _$MentionPodcastImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String? ?? "",
      imgUrl: const AttachmentConverter().fromJson(json['imgUrl'] as String),
    );

Map<String, dynamic> _$$MentionPodcastImplToJson(
        _$MentionPodcastImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'imgUrl': const AttachmentConverter().toJson(instance.imgUrl),
    };
