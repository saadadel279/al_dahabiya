import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelOrderButton extends StatelessWidget {
  const CancelOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: Center(
            child: Text(
          'الغاء الطلب',
          style: TextStyle(fontSize: 20.sp),
        )));
  }
}
