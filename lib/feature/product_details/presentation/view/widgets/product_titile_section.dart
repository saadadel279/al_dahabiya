import 'package:al_dahabiya/core/models/product_model.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/price_container.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/stars_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTitelSection extends StatelessWidget {
  const ProductTitelSection({
    super.key,
    this.productOfBrand,
  });
  final Product? productOfBrand;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  productOfBrand?.name ?? 'دلو بلاستيك',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color.fromARGB(255, 214, 213, 213)),
                ),
                Text(
                  productOfBrand?.type ?? 'للقمامة',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                const StarRow(),
                Text(
                  '${productOfBrand?.review} votes',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color.fromARGB(255, 12, 10, 10)),
                ),
                PriceContainer(
                  productOfBrand: productOfBrand,
                ),
              ],
            ),
            SizedBox(width: 40.w),
            SizedBox(
              height: 135.h,
              width: 135.w,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl:
                    'https://walker-stores.com/images/${productOfBrand?.image}',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/product.jpeg',
                  height: 130.h,
                  width: 150.w,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ]),
    );
  }
}
