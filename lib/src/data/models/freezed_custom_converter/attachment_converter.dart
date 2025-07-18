import 'dart:convert';

import 'package:cct_core/src/data/models/attachment/attachment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class AttachmentConverter implements JsonConverter<Attachment, String> {
  const AttachmentConverter();

  @override
  Attachment fromJson(String data) {
    return Attachment.fromJson(json.decode(data));
  }

  @override
  String toJson(Attachment attachment) {
    return """
    {
      "id" : ${attachment.id},
      "url" : "${attachment.url}",
      "filename" : "${attachment.filename}",
      "size" : ${attachment.size},
      "length" : ${attachment.length},
      "paragraphIndex" : ${attachment.paragraphIndex},
      "imageDescription": "${attachment.imageDescription}"
    }
    """;
  }
}

class AttachmentOrNullConverter implements JsonConverter<Attachment?, String?> {
  const AttachmentOrNullConverter();

  @override
  Attachment? fromJson(String? data) {
    return data != null && data.isNotEmpty
        ? Attachment.fromJson(json.decode(data))
        : null;
  }

  @override
  String? toJson(Attachment? attachment) {
    return attachment == null
        ? null
        : """{
      "id" : ${attachment.id},
      "url" : "${attachment.url}",
      "filename" : "${attachment.filename}",
      "size" : ${attachment.size},
      "length" : ${attachment.length},
      "paragraphIndex" : ${attachment.paragraphIndex},
      "imageDescription": "${attachment.imageDescription}"
    }""";
  }
}
