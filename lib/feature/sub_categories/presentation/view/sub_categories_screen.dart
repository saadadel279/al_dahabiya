import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.id});
  final int id;

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
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const SubCategoriesItem();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubCategoriesItem extends StatelessWidget {
  const SubCategoriesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          imageUrl:
              'https://tse1.mm.bing.net/th?id=OIP.JM6dTY_heMgc39tj43-BxQHaHa&pid=Api&P=0&h=220',
          width: double.infinity,
          fit: BoxFit.fill,
          height: 200.h,
        ),
        SizedBox(height: 15.h),
        Text(
          'منتج',
          style: TextStyle(fontSize: 25.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
