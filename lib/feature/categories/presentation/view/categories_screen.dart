import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/models/category_model.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/categories/data/repo/categories_repo.dart';
import 'package:al_dahabiya/feature/categories/presentation/view_model/cubit/categories_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                                return CategoryItemTitle(
                                  category:
                                      state.categoryResponseModel!.data[index],
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
            width: double.infinity,
            imageUrl: 'http://walker-stores.com/images/${category.image!}'),
        SizedBox(height: 15.w),
        Text(
          category.name!,
          style: TextStyle(fontSize: 25.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15.w),
      ],
    );
  }
}
