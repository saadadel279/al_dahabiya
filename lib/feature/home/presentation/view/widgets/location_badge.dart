import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationBanner extends StatelessWidget {
  const LocationBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 120.w,
        height: 35.h,
        decoration: const BoxDecoration(
          color: Color(0xFFEE6A61),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(20)),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            const Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
            SizedBox(width: 5.w),
            const Text(
              'Location',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
