import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/feature/splash/presentation/view_model/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, String>(
      listener: (context, state) {
        if (state == 'home') {
          GoRouter.of(context).pushReplacement(AppRouters.kHomeRoute);
        } else if (state == 'login') {
          GoRouter.of(context).pushReplacement(AppRouters.kLoginRoute);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFD04430),
        body: Center(
          child: Image.asset(
            'assets/images/Logo-removebg-preview.png',
            fit: BoxFit.fill,
            height: 200,
            width: 300,
          ),
        ),
      ),
    );
  }
}
