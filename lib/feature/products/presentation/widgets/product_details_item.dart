import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/product_feat.jpg',
              fit: BoxFit.fill,
              height: 95.h,
            ),
            SizedBox(height: 5.h),
            // Product Name
            Text(
              'حذاء رياضي',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),

            Text(
              'ب 120 ج.م/2قطعة',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
