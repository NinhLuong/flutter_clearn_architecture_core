// ThinhNguyen
// 17:22 25/9/24

import 'package:url_launcher/url_launcher.dart';

class UrlUtils {
  static Future<void> openLink(String? url, LaunchMode launchMode) async {
    if (url!.startsWith("https://link.concuatui.com")) {
      //TODO: handle dynamic link in app
    } else {
      launchUrl(Uri.parse(url), mode: launchMode);
    }
  }
}