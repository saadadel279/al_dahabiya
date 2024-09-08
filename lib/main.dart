import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setupServiceLocator();
  runApp(const AlDahabiya());
}

class AlDahabiya extends StatelessWidget {
  const AlDahabiya({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            theme: ThemeData(),
            routerConfig: AppRouters.router,
          );
        });
  }
}
