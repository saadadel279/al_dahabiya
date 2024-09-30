import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/models/product_model.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/sub_categorise_product.dart/data/repo/sub_categorise_product_repo.dart';
import 'package:al_dahabiya/feature/sub_categorise_product.dart/presentation/view_model/cubit/sub_categories_product_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SubCateoProdScreen extends StatelessWidget {
  const SubCateoProdScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubCategoriesProductCubit(
          SubCategoriseProductRepo(apiServices: DioConsumer(dio: Dio())))
        ..getSubCategoriseProduct(id),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                PageTitleBar(
                  isTitlePade: true,
                  pageTitle: 'المنتجات',
                ),
                SizedBox(height: 15.h),
                SizedBox(height: 15.h),
                BlocBuilder<SubCategoriesProductCubit,
                    SubCategoriesProductState>(
                  builder: (context, state) {
                    if (state is SubCategoriesProductSuccess) {
                      return Expanded(
                        child: GridView.builder(
                            itemCount:
                                state.subCategoriesProductModel!.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) =>
                                SubCategoriesProductItem(
                                  product: state
                                      .subCategoriesProductModel!.data[index],
                                )),
                      );
                    } else if (state is SubCategoriesProductFailure) {
                      return Center(child: Text(state.errorMessage));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubCategoriesProductItem extends StatelessWidget {
  const SubCategoriesProductItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouters.kProductDetailsRoute, extra: product);
        },
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: 'https://walker-stores.com/images/${product.image}',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              product.name!,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
