// ThinhNguyen
// 14:11 24/9/24


import 'package:cct_core/src/domain/entities/attachment/attachment_entity.dart';

class MentionArticleEntity {
  final int id;
  final List<AttachmentEntity> imgUrl;
  final String title;

  const MentionArticleEntity({
    required this.id,
    this.imgUrl = const [],
    required this.title,
  });
}