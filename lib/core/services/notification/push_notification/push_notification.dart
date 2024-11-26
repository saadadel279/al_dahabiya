import 'dart:convert';
import 'dart:developer';

import 'package:al_dahabiya/core/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../local_notification/local_notification.dart';

class PushNotification {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static Future init() async {
    await firebaseMessaging.requestPermission();
    String? fcmToken = await firebaseMessaging.getToken();
    log(fcmToken ?? 'no token');

    FirebaseMessaging.onBackgroundMessage(handelOnbackgroundMessage);
    handelOnForegroundMessage();
  }

  static Future<void> handelOnbackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'no title');
  }

  static Future<void> handelOnForegroundMessage() async {
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.showBasicNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Notification tapped while in foreground: ${message.notification?.title}');
      _navigateToScreen(message);
    });
  }


}

void _navigateToScreen(RemoteMessage message) {
  navigatorKey.currentContext?.go(AppRouters.kNotificationDetailsScreenRoute);
}
