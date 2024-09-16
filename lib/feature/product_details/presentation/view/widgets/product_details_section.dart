import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'counter.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
    required this.detailsTitle,
    this.details,
    this.isCounter,
  });

  final String detailsTitle;
  final String? details;
  final bool? isCounter;
  @override
  Widget build(BuildContext context) {
    return isCounter!
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                detailsTitle,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
              const CounterWidget()
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                detailsTitle,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
              Text(
                details!,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              )
            ],
          );
  }
}
