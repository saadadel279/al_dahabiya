import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/feature/home/presentation/view/widgets/product_item.dart';
import 'package:al_dahabiya/feature/home/presentation/view_model/brands_cubit/brands_cubit.dart';
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
      height: 100.h,
      child: BlocBuilder<BrandsCubit, BrandsState>(
        builder: (context, state) {
          if (state is BrandsSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categoriesModel!.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouters.kProductScreenRoute,
                          extra: state.categoriesModel!.data[index].id);
                    },
                    child: CategoryItem(
                      categories: state.categoriesModel!.data[index],
                    ));
              },
            );
          } else if (state is BrandsFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
