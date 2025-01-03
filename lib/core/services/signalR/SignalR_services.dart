import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../notification/local_notification/local_notification.dart';

class SignalRService {
  HubConnection? connection;

  Future<void> connectToSignalR() async {
    String baseUrl = 'https://pioneerspay.pioneers-solutions.info';
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJiYTYzOWQ3Ny0wODA4LTRlMGMtODJhMS1mMGY5NjIyNDVkYzUiLCJ1bmlxdWVfbmFtZSI6IjAxMTExODcxNTE3IiwiQXNwTmV0LklkZW50aXR5LlNlY3VyaXR5U3RhbXAiOiJKRlA0N1dDVU5YVFlYNFJDRzdORkVTUlVMNVlYRkNJQSIsInJvbGUiOiLYp9mE2KrYrNin2LEiLCJuYmYiOjE3MzI3MTQ2MTMsImV4cCI6MTczMzMxOTQxMywiaWF0IjoxNzMyNzE0NjEzLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo0NDMxOS8iLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo0NDMxOS8ifQ.xeqidLFnSLlRh_Nl3uakORwx5PVlVija4mejqj1tJ14'; // Replace with your token

    String url = '$baseUrl/MobNotificationsPioneersPay?access_token=$token';

    connection = HubConnectionBuilder()
        .withUrl(url, options: HttpConnectionOptions(requestTimeout: 20000))
        .build();
    connection!.on('MobileNotifiy', (args) {

      if (args != null && args.isNotEmpty) {
        try {
          log('message from SignalR: ${args[0].toString()}');
          RemoteMessage message = RemoteMessage(
            notification: RemoteNotification(
              title: 'SignalR Notification',
              body: args[0].toString()??'no body',
              android: const AndroidNotification(channelId: 'default_channel_id',),

            ),
          );

          LocalNotificationService.showBasicNotification(message);
        } catch (e) {
          log('Error processing SignalR message: $e');
        }
      } else {
        log('--------------- empty --------------------------');
      }
    });

    try {
      await connection!.start();
      log('Connected to SignalR hub');
    } catch (e) {
      log('Error connecting to SignalR: $e');
    }
  }
}
