import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/categories/data/repo/categores_repo.dart';
import 'package:al_dahabiya/feature/categories/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:al_dahabiya/feature/categories/presentation/widgets/categories_item.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/search_tap.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit(CategoresRepo(apiServices: DioConsumer(dio: Dio())))
            ..getCategories(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: SafeArea(
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
              Expanded(child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesSucsses) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          childAspectRatio: 2 / 3,
                        ),
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              GoRouter.of(context).push(
                                AppRouters.kCategoryProductDetailsScreen,
                                extra: state.categoriesModel!.data![index],
                              );
                            },
                            child: CategoryItem(
                              categort: state.categoriesModel!.data![index],
                            )),
                        itemCount: state.categoriesModel!.data!.length);
                  } else if (state is CategoriesFailuer) {
                    return const Center(child: Icon(Icons.error));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ))
            ],
          )),
        ),
      ),
    );
  }
}
