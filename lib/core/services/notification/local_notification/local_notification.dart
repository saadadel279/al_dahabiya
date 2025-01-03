import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../app_router.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static void onTap(NotificationResponse notificationResponse) {
    final payload = notificationResponse.payload;

    navigatorKey.currentContext?.push( AppRouters.kForegroundNotificationDetailsScreenRoute,extra:payload );


  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static void showBasicNotification(RemoteMessage message) async {
    AndroidNotificationDetails android =  AndroidNotificationDetails(
      message.notification!.android!.channelId ?? 'default_channel_id',
      message.notification?.title ?? 'no title',
      importance: Importance.max,
      priority: Priority.high,

    );


    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      details,
      payload:message.notification?.title,

    );
  }

}
