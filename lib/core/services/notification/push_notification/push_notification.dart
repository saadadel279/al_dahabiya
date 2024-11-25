import 'dart:developer';

import 'package:al_dahabiya/core/services/notification/local_notification/local_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static Future init() async {
    await firebaseMessaging.requestPermission();
    String? fcmToken = await firebaseMessaging.getToken();
    log(fcmToken ?? 'no token');
    FirebaseMessaging.onBackgroundMessage(handelOnbackgroundMessage);
    handelOnForegroundMessage();

  }
 static Future<void> handelOnbackgroundMessage(RemoteMessage mesaage)async {
    await Firebase.initializeApp();
    log(mesaage.notification?.title ?? 'no title');
  }
  static Future<void> handelOnForegroundMessage() async {
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.showBasicNotification(message);
    });
  }
}
