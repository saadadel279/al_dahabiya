import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/price_container.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/stars_row.dart';
import 'package:al_dahabiya/feature/products/data/models/brand_product_model.dart';
import 'package:al_dahabiya/feature/products/data/models/category_product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTitelSection extends StatelessWidget {
  const ProductTitelSection({
    super.key,
    this.productOfBrand,
    this.categoryProduct,
  });

  final ProductOfBrand? productOfBrand;
  final CategoryProduct? categoryProduct;

  @override
  Widget build(BuildContext context) {
    // Fallback values
    final String productName =
        productOfBrand?.name ?? categoryProduct?.name ?? 'دلو بلاستيك';
    final String productType =
        productOfBrand?.type ?? categoryProduct?.type ?? 'للقمامة';
    final String productImageUrl = productOfBrand?.image ??
        categoryProduct?.image ??
        'assets/images/product.jpeg';
    final num productReview =
        productOfBrand?.review ?? categoryProduct?.review ?? 0.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              // Product name with fallback
              Text(
                productName,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: const Color.fromARGB(255, 214, 213, 213)),
              ),
              // Product type with fallback
              Text(
                productType,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ),
              // Display star row
              const StarRow(),
              // Product review with fallback
              Text(
                '$productReview votes',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color.fromARGB(255, 12, 10, 10)),
              ),
              // Price container updated to handle both models
              PriceContainer(
                productOfBrand: productOfBrand,
                categoryProduct: categoryProduct,
              ),
            ],
          ),
          SizedBox(width: 20.w),
          // Cached image with proper fallback for both productOfBrand and categoryProduct
          CachedNetworkImage(
            imageUrl: 'https://walker-stores.com/api/$productImageUrl',
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Image.asset(
              'assets/images/product.jpeg',
              height: 130.h,
              width: 150.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
