import 'package:al_dahabiya/feature/Auth/presentation/view/login_screen.dart';
import 'package:al_dahabiya/feature/splash/presentation/view/splash_screen.dart';
import 'package:al_dahabiya/feature/splash/presentation/view_model/cubit/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const String kdefultRoute = '/';

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
        path: kHomeRoute,
        builder: (context, state) => LoginScreen(),
      ),
    ],
  );
}