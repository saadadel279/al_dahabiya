import 'package:al_dahabiya/core/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AlDahabiya());
}

class AlDahabiya extends StatelessWidget {
  const AlDahabiya({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(),
      routerConfig: AppRouters.router,
    );
  }
}
