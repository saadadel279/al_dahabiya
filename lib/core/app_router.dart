import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/models/product_model.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/data/repo/login_repo.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/presentation/view/login_screen.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/presentation/view_mode/cubit/login_cubit.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/data/repo/Sign_up_repo.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/presentation/view/sign_up_screen.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/presentation/view_model/cubit/sign_up_cubit.dart';
import 'package:al_dahabiya/feature/cart/presentation/view/cart_screen.dart';
import 'package:al_dahabiya/feature/favoreties/presentation/view/favoreties_screen.dart';
import 'package:al_dahabiya/feature/home/presentation/view/home_screen.dart';
import 'package:al_dahabiya/feature/initial/navebar.dart';
import 'package:al_dahabiya/feature/order_request/presentation/view/order_screen.dart';
import 'package:al_dahabiya/feature/product_details/presentation/view/product_details_screen.dart';
import 'package:al_dahabiya/feature/products/data/repo/brand_product_repo.dart';
import 'package:al_dahabiya/feature/products/presentation/view/products_screen.dart';
import 'package:al_dahabiya/feature/products/presentation/view_model/cubit/brand_products_cubit.dart';
import 'package:al_dahabiya/feature/splash/presentation/view/splash_screen.dart';
import 'package:al_dahabiya/feature/splash/presentation/view_model/cubit/splash_cubit.dart';
import 'package:al_dahabiya/feature/sub_categories/data/repo/sub_categories_repo.dart';
import 'package:al_dahabiya/feature/sub_categories/presentation/view/sub_categories_screen.dart';
import 'package:al_dahabiya/feature/sub_categories/presentation/view_model/cubit/sub_categories_cubit.dart';
import 'package:al_dahabiya/feature/sub_categorise_product.dart/presentation/view/sub_cateo_prod_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  static const String kOrderRequestScreenRoute = '/OrderRequestScreen';
  static const String kSubCategoriesScreenRoute = '/kSubCategoriesScreenRoute';
  static const String kSubCategoProdScreenRoute =
      '/kSubCategoriesProductScreenRoute';

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
        path: kOrderRequestScreenRoute,
        builder: (context, state) => const OrderRequestScreen(),
      ),
      GoRoute(
          path: kSubCategoProdScreenRoute,
          builder: (context, state) {
            final id = state.extra! as int;
            return SubCateoProdScreen(
              id: id,
            );
          }),
      GoRoute(
        path: kSubCategoriesScreenRoute,
        builder: (context, state) {
          final id = state.extra! as int;
          return BlocProvider(
            create: (context) => SubCategoriesCubit(
                SubCategoriesRepo(apiServices: DioConsumer(dio: Dio())))
              ..getSubCategories(id),
            child: SubCategoriesScreen(
              id: id,
            ),
          );
        },
      ),
      GoRoute(
        path: kCartScreenRoute,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: kProductScreenRoute,
        builder: (context, state) {
          final productId = state.extra! as int;
          return BlocProvider(
            create: (context) => BrandProductsCubit(
                BrandProductRepo(apiServices: DioConsumer(dio: Dio())))
              ..grtBrandProducts(productId),
            child: ProductsScreen(
              id: productId,
            ),
          );
        },
      ),
      GoRoute(
          path: kProductDetailsRoute,
          builder: (context, state) {
            final product = state.extra! as Product;
            return ProductDetailsScreen(
              productOfBrand: product,
            );
          }),
      GoRoute(
        path: kOffersRoute,
        builder: (context, state) => const FavoritsScreen(),
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
