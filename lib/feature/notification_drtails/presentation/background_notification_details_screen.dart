

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForegroundNotificationDetailsScreen extends StatelessWidget {
  const ForegroundNotificationDetailsScreen({super.key, required this.payload});
 final String? payload ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Notification Title ${payload}'?? 'no title'),),
    );
  }
}