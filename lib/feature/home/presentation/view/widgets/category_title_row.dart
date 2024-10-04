import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTitleRow extends StatelessWidget {
  const CategoryTitleRow({
    super.key,
    required this.categoryName,
    this.categoryAction,
    this.categoryActionNumber,
    this.isBoold,
  });

  final String categoryName;
  final String? categoryAction;
  final String? categoryActionNumber;
  final bool? isBoold;

  @override
  Widget build(BuildContext context) {
    final double categoryNameSize = isBoold == true ? 20.sp : 14.sp;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryName,
          style: TextStyle(fontSize: categoryNameSize.sp),
        ),
        Row(
          children: [
            Text(categoryAction ?? '',
                style: TextStyle(
                  fontSize: 15.sp,
                )),
            Text(categoryActionNumber != null ? " ($categoryActionNumber)" : '',
                style: TextStyle(fontSize: 14.sp)),
          ],
        ),
      ],
    );
  }
}
