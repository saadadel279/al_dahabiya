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
              fit: BoxFit.contain,
            ),
            SizedBox(height: 5.h),
            // Product Name
            Text(
              'حذاء رياضي',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            // Product Description (e.g. size, weight, etc.)
            Text(
              'ب 120 ج.م / 2قطعة',
              textAlign: TextAlign.center,
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
