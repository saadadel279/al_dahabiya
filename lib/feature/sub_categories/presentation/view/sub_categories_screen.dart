import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/models/category_model.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/sub_categories/presentation/view_model/cubit/sub_categories_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
                child: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
                  builder: (context, state) {
                    if (state is SubCategoriesSuccess) {
                      return ListView.builder(
                          itemCount:
                              state.subCategoriesModel!.data.categories.length,
                          itemBuilder: (context, index) {
                            return SubCategoriesItem(
                              subCategories: state
                                  .subCategoriesModel!.data.categories[index],
                            );
                          });
                    } else if (state is SubCategoriesFailure) {
                      return Center(child: Text(state.errorMessage));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
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
    required this.subCategories,
  });
  final Category subCategories;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouters.kSubCategoProdScreenRoute,
            extra: subCategories.id);
      },
      child: Column(
        children: [
          CachedNetworkImage(
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            imageUrl: 'http://walker-stores.com/images/${subCategories.image}',
            width: double.infinity,
            fit: BoxFit.fill,
            height: 200.h,
          ),
          SizedBox(height: 15.h),
          Text(
            subCategories.name!,
            style: TextStyle(fontSize: 25.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
