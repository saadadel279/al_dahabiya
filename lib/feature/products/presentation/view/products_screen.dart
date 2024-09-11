import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/search_tap.dart';
import 'package:al_dahabiya/feature/products/presentation/widgets/product_details_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              itemBuilder: (context, index) => const ProductDetailsItem(),
              itemCount: 9,
            ),
          )
        ],
      )),
    );
  }
}
