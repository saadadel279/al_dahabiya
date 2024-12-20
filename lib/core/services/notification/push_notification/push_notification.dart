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
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      _navigateToScreen(message);
    }
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _navigateToScreen(message);
    });
    FirebaseMessaging.onBackgroundMessage(handelOnbackgroundMessage);
    handelOnForegroundMessage();




  }

  static Future<void> handelOnbackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    LocalNotificationService.showBasicNotification(message);
  }

  static Future<void> handelOnForegroundMessage() async {
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.showBasicNotification(message);
    });
  }
}

void _navigateToScreen(RemoteMessage message) {
  log(message.notification!.title!.toString());
  navigatorKey.currentContext
      ?.push(AppRouters.kNotificationDetailsScreenRoute, extra: message);
}
