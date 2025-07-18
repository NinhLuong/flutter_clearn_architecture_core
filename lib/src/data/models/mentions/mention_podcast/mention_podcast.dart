// ThinhNguyen
// 11:36 24/9/24

import 'package:cct_core/src/data/models/attachment/attachment.dart';
import 'package:cct_core/src/data/models/freezed_custom_converter/attachment_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mention_podcast.freezed.dart';
part 'mention_podcast.g.dart';

@freezed
abstract class MentionPodcast with _$MentionPodcast {
  const factory MentionPodcast({
    required int id,
    required String title,
    required String author,
    @Default("") String description,
    @AttachmentConverter() required Attachment imgUrl,
  }) = _MentionPodcast;

  factory MentionPodcast.fromJson(Map<String, dynamic> json) =>
      _$MentionPodcastFromJson(json);
}