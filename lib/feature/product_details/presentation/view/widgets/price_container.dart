import 'package:al_dahabiya/core/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    super.key,
    this.productOfBrand,
  });
  final Product? productOfBrand;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 130.w,
      decoration: const BoxDecoration(
        color: Color(0xFFB13E55),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('%${productOfBrand?.discountPrice}',
            style: TextStyle(
              fontSize: 20.sp,
              color: const Color.fromARGB(255, 158, 156, 156),
              decoration: TextDecoration.lineThrough,
            )),
        SizedBox(width: 10.w),
        Text('\$${productOfBrand?.price}',
            style: TextStyle(
              fontSize: 25.sp,
              color: Colors.white,
            )),
      ]),
    );
  }
}
