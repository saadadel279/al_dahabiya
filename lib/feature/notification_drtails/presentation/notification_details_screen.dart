import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationDetailsScreenScreen extends StatelessWidget {
   const NotificationDetailsScreenScreen({super.key, required this.message});
  final RemoteMessage message ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Notification Title ${message.notification?.title}'?? 'no title'),),
    );
  }
}
