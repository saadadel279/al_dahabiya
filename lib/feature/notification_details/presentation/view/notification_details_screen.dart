import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({super.key, this.data});
  final Map<String, String>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Details')),
      body: Center(
        child: Text('Notification Data: ${data.toString()}'),
      ),
    );
  }
}
