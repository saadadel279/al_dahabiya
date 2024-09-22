import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/data/repo/login_repo.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/presentation/view/login_screen.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/presentation/view_mode/cubit/login_cubit.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/data/repo/Sign_up_repo.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/presentation/view/sign_up_screen.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/presentation/view_model/cubit/sign_up_cubit.dart';
import 'package:al_dahabiya/feature/cart/presentation/view/cart_screen.dart';
import 'package:al_dahabiya/feature/categories/presentation/view/categoty_product_details_screen.dart';
import 'package:al_dahabiya/feature/home/presentation/view/home_screen.dart';
import 'package:al_dahabiya/feature/initial/navebar.dart';
import 'package:al_dahabiya/feature/offers/data/repo/offer_repo.dart';
import 'package:al_dahabiya/feature/offers/presentation/view/offers_screen.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/product_details_screen.dart';
import 'package:al_dahabiya/feature/products/data/models/brand_product_model.dart';
import 'package:al_dahabiya/feature/products/data/models/category_product_model.dart';
import 'package:al_dahabiya/feature/products/presentation/view/brand_products_screen.dart';
import 'package:al_dahabiya/feature/splash/presentation/view/splash_screen.dart';
import 'package:al_dahabiya/feature/splash/presentation/view_model/cubit/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../feature/offers/presentation/view_model/offers_cubit/offers_cubit.dart';

abstract class AppRouters {
  static const String kFirstRoute = '/first';
  static const String kdefultRoute = '/';

  static const String kLoginRoute = '/login';
  static const String kSignUpRoute = '/signup';
  static const String kHomeRoute = '/home';
  static const String kOffersRoute = '/offers';
  static const String kProductDetailsRoute = '/productDetails';
  static const String kProductScreenRoute = '/ProductsScreen';
  static const String kCartScreenRoute = '/CartScreen';
  static const String kCategoryProductDetailsScreen =
      '/CategoryProductDetailsScreen';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kdefultRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit()..startSplashScreen(),
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: kFirstRoute,
        builder: (context, state) => const CustomBottomNaveBar(),
      ),
      GoRoute(
        path: kCartScreenRoute,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: kCategoryProductDetailsScreen,
        builder: (context, state) {
          final product = state.extra! as CategoryProduct;

          return CategoryProductDetailsScreen(
            categoryProduct: product,
          );
        },
      ),
      GoRoute(
        path: kProductScreenRoute,
        builder: (context, state) {
          final productId = state.extra! as int;
          return ProductsScreen(
            id: productId,
          );
        },
      ),
      GoRoute(
          path: kProductDetailsRoute,
          builder: (context, state) {
            final product = state.extra! as ProductOfBrand;
            return ProductDetailsScreen(
              productOfBrand: product,
            );
          }),
      GoRoute(
        path: kOffersRoute,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              OffersCubit(OfferRepo(apiServices: DioConsumer(dio: Dio())))
                ..getOffers(),
          child: const OffersScreen(),
        ),
      ),
      GoRoute(
        path: kLoginRoute,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              LoginCubit(LoginRepo(apiServices: DioConsumer(dio: Dio()))),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: kSignUpRoute,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SignUpCubit(SignUpRepo(apiServices: DioConsumer(dio: Dio()))),
          child: SignUpScreen(),
        ),
      ),
      GoRoute(
        path: kHomeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
