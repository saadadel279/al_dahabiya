import 'package:al_dahabiya/feature/home/data/models/brands_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
    required this.brand,
  });
  final Brand brand;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: 'http://walker-stores.com/images/${brand.image}',
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          brand.name,
          style: TextStyle(fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
