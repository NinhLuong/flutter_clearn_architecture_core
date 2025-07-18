import 'dart:convert';

import 'package:cct_core/src/data/models/attachment/attachment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class AttachmentListConverter
    implements JsonConverter<List<Attachment>, String> {
  const AttachmentListConverter();

  @override
  List<Attachment> fromJson(String jsonList) {
    if (jsonList.isEmpty) return [];
    List<dynamic> resMap = json.decode(jsonList);
    return resMap.map((e) => Attachment.fromJson(e)).toList();
  }

  @override
  String toJson(List<Attachment> attachmentList) {
    return json.encode(
        attachmentList.map((attachment) => attachment.toJson()).toList());
  }
}

class AttachmentListOrNullConverter
    implements JsonConverter<List<Attachment>?, String?> {
  const AttachmentListOrNullConverter();

  @override
  List<Attachment>? fromJson(String? jsonList) {
    if (jsonList == null || jsonList.isEmpty) return [];
    List<dynamic> resMap = json.decode(jsonList);
    return resMap.map((e) => Attachment.fromJson(e)).toList();
  }

  @override
  String? toJson(List<Attachment>? attachmentList) {
    return "";
  }
}
