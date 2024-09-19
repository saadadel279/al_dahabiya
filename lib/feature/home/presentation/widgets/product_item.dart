import 'package:al_dahabiya/feature/home/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categories,
  });
  final Category categories;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            'https://walker-stores.com/api/categories${categories.image}',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          categories.name,
          style: TextStyle(fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
