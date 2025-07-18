import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

@freezed
abstract class Attachment with _$Attachment {
  const factory Attachment({
    @Default(-1) int id,
    @Default("") String url,
    @Default("") String filename,
    @Default(-1) int size,
    @Default(-1) int length,
    @Default(-1) int paragraphIndex,
    @Default("") String imageDescription,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}
