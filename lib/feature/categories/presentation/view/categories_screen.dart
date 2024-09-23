import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/home/presentation/view/widgets/category_title_row.dart';
import 'package:al_dahabiya/feature/home/presentation/view/widgets/search_tap.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              PageTitleBar(
                isTitlePade: true,
                pageTitle: 'الاصناف',
              ),
              SizedBox(height: 15.h),
              const SearshTap(),
              SizedBox(height: 15.h),
              const Directionality(
                textDirection: TextDirection.rtl,
                child: CategoryTitleRow(
                  categoryName: 'الاصناف',
                  categoryAction: 'مشاهدة الكل',
                  categoryActionNumber: '5',
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                            imageUrl:
                                'https://tse1.mm.bing.net/th?id=OIP.JM6dTY_heMgc39tj43-BxQHaHa&pid=Api&P=0&h=220',
                            height: 120.h,
                            width: 120.w,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'منتج',
                            style: TextStyle(fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
