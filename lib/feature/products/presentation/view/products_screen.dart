import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/search_tap.dart';
import 'package:al_dahabiya/feature/products/presentation/widgets/product_details_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 15.h),
            PageTitleBar(
              isTitlePade: true,
              pageTitle: 'المنتجات',
            ),
            SizedBox(height: 15.h),
            const SearshTap(),
            SizedBox(height: 15.h),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      GoRouter.of(context)
                          .push(AppRouters.kProductDetailsRoute);
                    },
                    child: const ProductDetailsItem()),
                itemCount: 9,
              ),
            )
          ],
        )),
      ),
    );
  }
}
