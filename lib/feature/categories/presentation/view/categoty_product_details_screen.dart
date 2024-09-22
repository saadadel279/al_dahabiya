import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/product_details_section.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/product_titile_section.dart';
import 'package:al_dahabiya/feature/products/data/models/category_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryProductDetailsScreen extends StatelessWidget {
  const CategoryProductDetailsScreen({
    super.key,
    this.categoryProduct,
  });

  final CategoryProduct? categoryProduct;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFCB6C7F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 2.2 / 3 * height,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 80.h),
                      ProductDetailsSection(
                        isCounter: false,
                        detailsTitle: 'الخامات',
                        details: categoryProduct!.desc ??
                            'مصنوع من البلاستيك المقوى',
                      ),
                      SizedBox(height: 20.h),
                      ProductDetailsSection(
                        isCounter: false,
                        detailsTitle: 'وصف المنتج',
                        details: categoryProduct!.desc ??
                            'دلو يستخدم لتذويب المعقمات بإستخدام وسائل التنظبف في الماء عند المسح  العلامة التجارية : الهلال والنجمة',
                      ),
                      SizedBox(height: 20.h),
                      const ProductDetailsSection(
                        isCounter: true,
                        detailsTitle: 'الكمية',
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .push(AppRouters.kCartScreenRoute);
                          },
                          child: Container(
                              height: 30.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFB13E55),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  'إضافة الى السلة',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -100.h,
                child: ProductTitelSection(
                  categoryProduct: categoryProduct,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
