import 'package:al_dahabiya/feature/Auth/featuers/login/presentation/view/login_screen.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/presentation/view/sign_up_screen.dart';
import 'package:al_dahabiya/feature/splash/presentation/view/splash_screen.dart';
import 'package:al_dahabiya/feature/splash/presentation/view_model/cubit/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const String kdefultRoute = '/';

  static const String kLoginRoute = '/login';
  static const String kSignUpRoute = '/signup';

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
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: kLoginRoute,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: kSignUpRoute,
        builder: (context, state) => SignUpScreen(),
      ),
    ],
  );
}
