import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0.r),
      child: Image.asset(
        'assets/images/offer.png',
        height: 100.h,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
