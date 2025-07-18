// ThinhNguyen
// 15:09 16/9/24

import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationService {
  void initialize(String appId) {
    OneSignal.initialize(appId);
  }

  String get subscriptionId =>
      OneSignal.User.pushSubscription.id ?? "no_subscription_id";
}
