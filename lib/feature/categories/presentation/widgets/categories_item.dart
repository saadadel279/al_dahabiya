import 'package:al_dahabiya/feature/categories/data/models/categories_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categort,
  });
  final Category categort;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: 'http://walker-stores.com/images/${categort.image}',
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          categort.name,
          style: TextStyle(fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
