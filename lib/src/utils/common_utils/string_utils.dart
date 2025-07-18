import "dart:convert";

import "package:crypto/crypto.dart";
import "package:unorm_dart/unorm_dart.dart" as unorm;

extension StringExtension on String {
  String sha256ofString() {
    final bytes = utf8.encode(this);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  String removeVietnameseAccent() {
    var normalizedString = unorm.nfd(this);
    var pattern = RegExp(r'[\u0300-\u036f]');
    return normalizedString.replaceAll(pattern, '');
  }

  String normalizationForGraphql() {
    final pattern = RegExp(r'"(.*?)"');
    String modifiedText =
        replaceAllMapped(pattern, (match) => "'${match.group(1)}'");
    return modifiedText.replaceAll("\n", "\\\\n");
  }

  String removeHtmlTags() {
    final regex = RegExp(r'<[^>]+>');
    return replaceAll(regex, '');
  }
}
