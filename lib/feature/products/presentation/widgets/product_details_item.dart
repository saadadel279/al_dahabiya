import 'package:al_dahabiya/feature/products/data/models/brand_product_model.dart';
import 'package:al_dahabiya/feature/products/data/models/category_product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({
    super.key,
    this.productOfBrand,
    this.categoryProduct,
  });
  final ProductOfBrand? productOfBrand;
  final CategoryProduct? categoryProduct;

  @override
  Widget build(BuildContext context) {
    final String imageUrl = categoryProduct != null
        ? 'http://walker-stores.com/images/${categoryProduct!.image}'
        : (productOfBrand != null
            ? 'http://walker-stores.com/images/${productOfBrand!.image}'
            : '');

    final String name = categoryProduct != null
        ? categoryProduct!.name ?? 'Unknown Category'
        : (productOfBrand != null
            ? productOfBrand!.name ?? 'Unknown Brand'
            : 'Unknown'); // Fallback for name

    if (productOfBrand == null && categoryProduct == null) {
      return const Center(child: Icon(Icons.error));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image loading
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
            SizedBox(height: 5.h),
            // Product Name
            Text(
              name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            if (productOfBrand != null)
              Text(
                '${productOfBrand!.price.toString()}/${productOfBrand!.quantity.toString()}',
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
