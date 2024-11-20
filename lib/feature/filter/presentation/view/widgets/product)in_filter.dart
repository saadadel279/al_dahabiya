import 'package:al_dahabiya/core/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/models/product_model.dart';

class ProductInFilter extends StatelessWidget {
  final Product product;

  const ProductInFilter({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouters.kProductDetailsRoute,extra: product);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        ),
        height: 200,
        width: 80,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Image.network(
                  'http://walker-stores.com/images/${product.image}' ,
                  width: 160.w,
                  height: 100.h,

                ),
              ),
              SizedBox(height: 10.h),

              Text(
                '${product.price} ج.م',
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),

              Text(
                product.name!,
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),

              Text(

                product.desc! ,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
