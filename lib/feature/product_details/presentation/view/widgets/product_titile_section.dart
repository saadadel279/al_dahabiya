import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/price_container.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/stars_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTitelSection extends StatelessWidget {
  const ProductTitelSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Column(
          children: [
            Text(
              'دلو بلاستيك',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: const Color.fromARGB(255, 214, 213, 213)),
            ),
            Text(
              'للقمامة',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: const Color.fromARGB(255, 12, 10, 10)),
            ),
            const StarRow(),
            Text(
              '120 votes',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color.fromARGB(255, 12, 10, 10)),
            ),
            const PriceContainer(),
          ],
        ),
        SizedBox(width: 20.w),
        Column(
          children: [
            Image.asset(
              'assets/images/product.jpeg',
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ],
        )
      ]),
    );
  }
}
