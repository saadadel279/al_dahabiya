import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 0,
          childAspectRatio: 0.90,
        ),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouters.kProductDetailsRoute);
              },
              child: const ProductItem());
        },
      ),
    );
  }
}
