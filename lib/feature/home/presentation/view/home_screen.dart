import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/home/data/repo/categories_repo.dart';
import 'package:al_dahabiya/feature/home/presentation/view_model/brands_cubit/brands_cubit.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/banner.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/category_title_row.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/offers_listview.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/product_list_view.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/search_tap.dart';
import 'package:al_dahabiya/feature/offers/data/repo/offer_repo.dart';
import 'package:al_dahabiya/feature/offers/presentation/view_model/offers_cubit/offers_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  PageTitleBar(
                    isTitlePade: false,
                  ),
                  SizedBox(height: 15.h),
                  const SearshTap(),
                  SizedBox(height: 15.h),
                  const BannerImage(),
                  SizedBox(height: 15.h),
                  const CategoryTitleRow(
                    categoryName: 'البراندات',
                    categoryAction: 'مشاهدة الكل',
                    categoryActionNumber: '1',
                  ),
                  SizedBox(height: 15.h),
                  BlocProvider(
                    create: (context) => BrandsCubit(
                        BrandsRepo(apiServices: DioConsumer(dio: Dio())))
                      ..getCategories(),
                    child: const CategoriesListView(),
                  ),
                  SizedBox(height: 15.h),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouters.kOffersRoute);
                    },
                    child: const CategoryTitleRow(
                      categoryName: 'عروض اليوم',
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 105.h,
                    child: BlocProvider(
                      create: (context) => OffersCubit(
                          OfferRepo(apiServices: DioConsumer(dio: Dio())))
                        ..getOffers(),
                      child: const OffersListView(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
