import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/models/category_model.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/categories/data/repo/categories_repo.dart';
import 'package:al_dahabiya/feature/categories/presentation/view_model/cubit/categories_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit(CategoriesRepo(apiServices: DioConsumer(dio: Dio())))
            ..getCategories(),
      child: Scaffold(
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
                SizedBox(height: 15.h),
                Expanded(
                  child: Center(
                    child: BlocBuilder<CategoriesCubit, CategoriesState>(
                      builder: (context, state) {
                        if (state is CategoriesSuccess) {
                          return ListView.builder(
                              itemCount:
                                  state.categoryResponseModel!.data.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    GoRouter.of(context).push(
                                      AppRouters.kSubCategoriesScreenRoute,
                                      extra: state.categoryResponseModel!
                                          .data[index].id,
                                    );
                                  },
                                  child: CategoryItemTitle(
                                    category: state
                                        .categoryResponseModel!.data[index],
                                  ),
                                );
                              });
                        } else if (state is CategoriesFailure) {
                          return Center(child: Text(state.errorMessage));
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItemTitle extends StatelessWidget {
  const CategoryItemTitle({
    super.key,
    required this.category,
  });
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            width: double.infinity,
            fit: BoxFit.fill,
            height: 200.h,
            imageUrl: 'http://walker-stores.com/images/${category.image!}'),
        SizedBox(height: 15.h),
        Text(
          category.name!,
          style: TextStyle(fontSize: 25.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
