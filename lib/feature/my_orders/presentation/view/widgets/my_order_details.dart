import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderDetailsItem extends StatelessWidget {
  const MyOrderDetailsItem({
    super.key,
    required this.title,
    required this.details,
  });

  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: TextStyle(
              fontSize: 20.sp,
            )),
        Text(details,
            style: TextStyle(
              fontSize: 20.sp,
            )),
      ],
    );
  }
}
