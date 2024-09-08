import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontSize: 15.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 32, 32, 32),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
