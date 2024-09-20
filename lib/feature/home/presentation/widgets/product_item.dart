import 'package:al_dahabiya/feature/home/data/models/brands_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categories,
  });
  final Brand categories;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl:
                'https://walker-stores.com/api/categories${categories.image}',
            placeholder: (context, url) =>
                const Center(child: Icon(Icons.error)),
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
