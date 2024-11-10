import 'package:al_dahabiya/feature/favoreties/data/models/favorite_iteam_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritProductItem extends StatelessWidget {
  const FavoritProductItem({super.key, required this.product});

  final FavoritItemModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 130.h,
            child: CachedNetworkImage(
              imageUrl: 'https://walker-stores.com/images/${product.imageUrl}',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            product.name,
            style: TextStyle(fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
