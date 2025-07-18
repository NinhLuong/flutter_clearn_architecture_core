// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentImpl _$$AttachmentImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      url: json['url'] as String? ?? "",
      filename: json['filename'] as String? ?? "",
      size: (json['size'] as num?)?.toInt() ?? -1,
      length: (json['length'] as num?)?.toInt() ?? -1,
      paragraphIndex: (json['paragraphIndex'] as num?)?.toInt() ?? -1,
      imageDescription: json['imageDescription'] as String? ?? "",
    );

Map<String, dynamic> _$$AttachmentImplToJson(_$AttachmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'filename': instance.filename,
      'size': instance.size,
      'length': instance.length,
      'paragraphIndex': instance.paragraphIndex,
      'imageDescription': instance.imageDescription,
    };
