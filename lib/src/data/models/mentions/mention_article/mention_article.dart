// ThinhNguyen
// 11:36 24/9/24

import 'package:cct_core/src/data/models/attachment/attachment.dart';
import 'package:cct_core/src/data/models/freezed_custom_converter/attachment_list_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mention_article.freezed.dart';
part 'mention_article.g.dart';

@freezed
abstract class MentionArticle with _$MentionArticle {
  const factory MentionArticle({
    required int id,
    @Default([]) @AttachmentListConverter() List<Attachment> imgUrl,
    required String title,
  }) = _MentionArticle;

  factory MentionArticle.fromJson(Map<String, dynamic> json) =>
      _$MentionArticleFromJson(json);
}
