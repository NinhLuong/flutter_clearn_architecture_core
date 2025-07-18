import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
@HiveType(typeId: 0)
class Auth with _$Auth {
  const factory Auth({
    @HiveField(0) required String accessToken,
    @HiveField(1) required String refreshToken,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
