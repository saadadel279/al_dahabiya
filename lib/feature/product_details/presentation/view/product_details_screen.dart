import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:al_dahabiya/core/database/sql_db.dart';
import 'package:al_dahabiya/core/models/product_model.dart';
import 'package:al_dahabiya/core/widgets/snak_bar.dart';
import 'package:al_dahabiya/feature/cart/data/repo/cart_repo.dart';
import 'package:al_dahabiya/feature/cart/presentation/view_mode/cubit/cart_cubit.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/product_details_section.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/widgets/product_titile_section.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view_model/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    this.productOfBrand,
  });

  final Product? productOfBrand;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(CartRepo(sqlDB: SqlDB())),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddOrDeleatToCartSuccess) {
            showSnackBar(context, 'تمت الاضافة الي السلة');
          } else if (state is CartFailure) {
            showSnackBar(context, 'هذا المنتج موجود بالفعل في السلة');
          } else {
            print('Current state: $state');
          }
        },
        child: Scaffold(
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
                            details: productOfBrand!.desc ??
                                'مصنوع من البلاستيك المقوى',
                          ),
                          SizedBox(height: 20.h),
                          ProductDetailsSection(
                            isCounter: false,
                            detailsTitle: 'وصف المنتج',
                            details: productOfBrand!.desc ??
                                'دلو يستخدم لتذويب المعقمات بإستخدام وسائل التنظبف في الماء عند المسح  العلامة التجارية : الهلال والنجمة',
                          ),
                          SizedBox(height: 20.h),
                          const ProductDetailsSection(
                            isCounter: true,
                            detailsTitle: 'الكمية',
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: Builder(builder: (context) {
                              return InkWell(
                                onTap: () {
                                  var productQuantity =
                                      CacheHelper().getData(key: 'counter');

                                  context.read<CartCubit>().insertCartItem(
                                      productOfBrand!.id!,
                                      '''INSERT INTO cart (product_id, name, price, imageUrl, quantity) VALUES (${productOfBrand!.id!}, '${productOfBrand!.name!}', ${productOfBrand!.price!}, '${productOfBrand!.image!}', $productQuantity)''',
                                      productQuantity);
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
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -100.h,
                    child: ProductTitelSection(
                      productOfBrand: productOfBrand,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
