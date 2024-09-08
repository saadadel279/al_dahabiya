import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/data/repo/login_repo.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/presentation/view/login_screen.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/presentation/view_mode/cubit/login_cubit.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/data/repo/Sign_up_repo.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/presentation/view/sign_up_screen.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/presentation/view_model/cubit/sign_up_cubit.dart';
import 'package:al_dahabiya/feature/home/presentation/view/home_screen.dart';
import 'package:al_dahabiya/feature/splash/presentation/view/splash_screen.dart';
import 'package:al_dahabiya/feature/splash/presentation/view_model/cubit/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const String kdefultRoute = '/';

  static const String kLoginRoute = '/login';
  static const String kSignUpRoute = '/signup';
  static const String kHomeRoute = '/home';

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
