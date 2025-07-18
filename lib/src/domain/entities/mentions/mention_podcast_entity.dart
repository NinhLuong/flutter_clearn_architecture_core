// ThinhNguyen
// 14:11 24/9/24

import 'package:cct_core/src/domain/entities/attachment/attachment_entity.dart';

class MentionPodcastEntity {
  final int id;
  final String title;
  final String author;
  final String description;
  final AttachmentEntity imgUrl;

  const MentionPodcastEntity({
    required this.id,
    required this.title,
    required this.author,
    this.description = "",
    required this.imgUrl,
  });
}