import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTitleRow extends StatelessWidget {
  const CategoryTitleRow({
    super.key,
    required this.categoryName,
    this.categoryAction,
    this.categoryActionNumber,
  });

  final String categoryName;
  final String? categoryAction;
  final String? categoryActionNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryName,
          style: TextStyle(fontSize: 14.sp),
        ),
        Row(
          children: [
            Text(categoryAction ?? '',
                style: TextStyle(
                  fontSize: 15.sp,
                )),
            Text(categoryActionNumber ?? '', style: TextStyle(fontSize: 14.sp)),
          ],
        ),
      ],
    );
  }
}
