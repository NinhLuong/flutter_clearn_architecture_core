// ThinhNguyen
// 09:33 16/9/24

import 'package:cct_config/cct_config.dart';

class AttachmentEntity {
  final int id;
  final String url;
  final String filename;
  final int size;
  final int length;
  final int paragraphIndex;
  final String imageDescription;

  AttachmentEntity({
    required this.id,
    required this.url,
    required this.filename,
    required this.size,
    required this.length,
    required this.paragraphIndex,
    required this.imageDescription,
  });

  bool get isValid => id != -1 && url.isNotEmpty && filename.isNotEmpty;

  bool get hasSize => size > 0;

  bool get hasLength => length > 0;

  bool get isAssociatedWithParagraph => paragraphIndex != -1;

  bool get hasImageDescription => imageDescription.isNotEmpty;

  String get fileExtension {
    final parts = filename.split('.');
    return parts.length > 1 ? parts.last : '';
  }

  String getAttachmentUrl() {
    return isExtendedAttachment() &&
        !url.contains(Config.api.fileServerEndpoint)
        ? Config.api.fileServerEndpoint + url
        : url;
  }

  bool isExtendedAttachment() {
    return id == ConfigMiscConstants.image ||
        id == ConfigMiscConstants.audio ||
        id == ConfigMiscConstants.video ||
        id == ConfigMiscConstants.file;
  }

  AttachmentEntity copyWith({
    int? id,
    String? url,
    String? filename,
    int? size,
    int? length,
    int? paragraphIndex,
    String? imageDescription,
  }) {
    return AttachmentEntity(
      id: id ?? this.id,
      url: url ?? this.url,
      filename: filename ?? this.filename,
      size: size ?? this.size,
      length: length ?? this.length,
      paragraphIndex: paragraphIndex ?? this.paragraphIndex,
      imageDescription: imageDescription ?? this.imageDescription,
    );
  }

  AttachmentEntity addImageDescription(String description) {
    return copyWith(imageDescription: description);
  }

  AttachmentEntity associateWithParagraph(int index) {
    return copyWith(paragraphIndex: index);
  }
}