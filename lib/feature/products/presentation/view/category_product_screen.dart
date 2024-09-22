import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/search_tap.dart';
import 'package:al_dahabiya/feature/products/data/repo/categories_product_repo.dart';
import 'package:al_dahabiya/feature/products/presentation/view_model/Category_product_cubit/category_product_cubit.dart';
import 'package:al_dahabiya/feature/products/presentation/widgets/product_details_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryProductScreen extends StatelessWidget {
  const CategoryProductScreen({super.key, this.id});

  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryProductCubit(
          CategoryProductRepo(apiServices: DioConsumer(dio: Dio())))
        ..getCategoryProducts(id!),
      child: Scaffold(
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
                child: BlocBuilder<CategoryProductCubit, CategoryProductState>(
                  builder: (context, state) {
                    if (state is CategoryProductSuccess) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2 / 3,
                        ),
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              GoRouter.of(context).push(
                                  AppRouters.kCategoryProductDetailsScreen,
                                  extra: state
                                      .categoryProductModel!.data![index].id);
                            },
                            child: ProductDetailsItem(
                              categoryProduct:
                                  state.categoryProductModel!.data![index],
                            )),
                        itemCount: state.categoryProductModel!.data!.length,
                      );
                    } else if (state is CategoryProductFailure) {
                      return Center(child: Text(state.errMessage));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
