import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../notification/local_notification/local_notification.dart';

class SignalRService {
  HubConnection? _connection;

  Future<void> connectToSignalR() async {
    String baseUrl = 'https://pioneerspay.pioneers-solutions.info';
    String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJiYTYzOWQ3Ny0wODA4LTRlMGMtODJhMS1mMGY5NjIyNDVkYzUiLCJ1bmlxdWVfbmFtZSI6IjAxMTExODcxNTE3IiwiQXNwTmV0LklkZW50aXR5LlNlY3VyaXR5U3RhbXAiOiJKRlA0N1dDVU5YVFlYNFJDRzdORkVTUlVMNVlYRkNJQSIsInJvbGUiOiLYp9mE2KrYrNin2LEiLCJuYmYiOjE3MzI3MTQ2MTMsImV4cCI6MTczMzMxOTQxMywiaWF0IjoxNzMyNzE0NjEzLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo0NDMxOS8iLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo0NDMxOS8ifQ.xeqidLFnSLlRh_Nl3uakORwx5PVlVija4mejqj1tJ14'; // Replace with your token

    String url = '$baseUrl/MobNotificationsPioneersPay?access_token=$token';

    _connection = HubConnectionBuilder()
        .withUrl(url,
            options: HttpConnectionOptions(
                requestTimeout: 10000
            ))
        .build();
    _connection!.on('message', (args) {
      log('Received message from SignalR: $args');

      // Create a RemoteMessage object with the received data
      RemoteMessage message = RemoteMessage(
        notification: RemoteNotification(
          title: 'SignalR Notification',
          body: args.toString(), // Adjust this as needed based on your message format
        ),
      );

      // Trigger the local notification service
      LocalNotificationService.showBasicNotification(message);
    });

    try {
      await _connection!.start();
      log('Connected to SignalR hub');
    } catch (e) {
      log('Error connecting to SignalR: $e');
    }
  }
}
