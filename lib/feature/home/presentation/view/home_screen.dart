import 'package:al_dahabiya/feature/home/presentation/widgets/banner.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/category_title_row.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/location_badge.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/offers_listview.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/product_list_view.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/search_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Directionality(
                            textDirection: TextDirection.ltr,
                            child: LocationBadge()),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  const SearshTap(),
                  SizedBox(height: 15.h),
                  const BannerImage(),
                  SizedBox(height: 15.h),
                  const CategoryTitleRow(
                    categoryName: 'الاصناف',
                    categoryAction: 'مشاهدة الكل',
                    categoryActionNumber: '30',
                  ),
                  SizedBox(height: 15.h),
                  const ProductListView(),
                  SizedBox(height: 15.h),
                  const CategoryTitleRow(
                    categoryName: 'عروض اليوم',
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 105.h,
                    child: const OffersListView(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
