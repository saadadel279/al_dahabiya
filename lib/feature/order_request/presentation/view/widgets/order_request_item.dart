import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderRequestItem extends StatelessWidget {
  const OrderRequestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Image.asset(
            'assets/images/Logo-removebg-preview.png',
            height: 85.h,
          ),
          SizedBox(height: 10.h),
          Text(
            'منتج',
            style: TextStyle(fontSize: 16.sp),
          ),
          Text(
            '25 ج.م',
            style: TextStyle(color: Colors.red, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
