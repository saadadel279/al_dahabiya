import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/feature/home/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesSuccess) {
            return GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categoriesModel!.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      GoRouter.of(context)
                          .push(AppRouters.kProductDetailsRoute);
                    },
                    child: CategoryItem(
                      categories: state.categoriesModel!.data[index],
                    ));
              },
            );
          } else if (state is CategoriesFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
