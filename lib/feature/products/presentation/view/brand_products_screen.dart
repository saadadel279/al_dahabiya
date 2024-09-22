import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/search_tap.dart';
import 'package:al_dahabiya/feature/products/data/repo/brand_product_repo.dart';
import 'package:al_dahabiya/feature/products/presentation/view_model/brand_cubit/brand_products_cubit.dart';
import 'package:al_dahabiya/feature/products/presentation/widgets/product_details_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, this.id});

  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandProductsCubit(
          BrandProductRepo(apiServices: DioConsumer(dio: Dio())))
        ..grtBrandProducts(id!),
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
                child: BlocBuilder<BrandProductsCubit, BrandProductsState>(
                  builder: (context, state) {
                    if (state is BrandProductsSuccess) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2 / 3,
                        ),
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              GoRouter.of(context).push(
                                  AppRouters.kProductDetailsRoute,
                                  extra: state.brandProductModel!.data![index]);
                            },
                            child: ProductDetailsItem(
                              productOfBrand:
                                  state.brandProductModel!.data![index],
                            )),
                        itemCount: state.brandProductModel!.data!.length,
                      );
                    } else if (state is BrandProductsFailure) {
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
