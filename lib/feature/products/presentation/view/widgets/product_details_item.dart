import 'package:al_dahabiya/core/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({
    super.key,
    required this.productOfBrand,
  });
  final Product productOfBrand;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 89.h,
              child: CachedNetworkImage(
                height: 95.h,
                fit: BoxFit.fitWidth,
                imageUrl:
                    'https://walker-stores.com/images/${productOfBrand.image}',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(height: 5.h),
            // Product Name
            Text(
              productOfBrand.name ?? 'حذاء رياضي',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),

            Text(
              '${productOfBrand.price.toString()}/${productOfBrand.quantity.toString()}',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
