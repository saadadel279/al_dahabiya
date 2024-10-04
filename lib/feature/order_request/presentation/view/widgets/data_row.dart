import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataRowItem extends StatelessWidget {
  const DataRowItem({
    super.key,
    required this.icon,
    required this.data,
  });
  final Icon icon;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: Row(
          children: [
            Icon(
              icon.icon,
              color: Colors.red,
            ),
            SizedBox(width: 10.w),
            Text(
              data,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color.fromARGB(255, 135, 134, 134)),
            )
          ],
        ),
      ),
    );
  }
}
