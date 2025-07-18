// ThinhNguyen
// 14:05 17/9/24

import 'package:cct_core/src/data/models/attachment/attachment.dart';
import 'package:cct_core/src/domain/entities/attachment/attachment_entity.dart';

class AttachmentMapper {
  static Attachment entityToModel(AttachmentEntity entity) {
    return Attachment(
      id: entity.id,
      url: entity.url,
      filename: entity.filename,
      size: entity.size,
      length: entity.length,
      paragraphIndex: entity.paragraphIndex,
      imageDescription: entity.imageDescription,
    );
  }

  static AttachmentEntity modelToEntity(Attachment model) {
    return AttachmentEntity(
      id: model.id,
      url: model.url,
      filename: model.filename,
      size: model.size,
      length: model.length,
      paragraphIndex: model.paragraphIndex,
      imageDescription: model.imageDescription,
    );
  }

  static List<Attachment> entityListToModelList(List<AttachmentEntity> entities) {
    return entities.map((entity) => entityToModel(entity)).toList();
  }

  static List<AttachmentEntity> modelListToEntityList(List<Attachment> models) {
    return models.map((model) => modelToEntity(model)).toList();
  }
}