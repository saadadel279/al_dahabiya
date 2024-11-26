import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:al_dahabiya/core/services/notification/local_notification/local_notification.dart';
import 'package:al_dahabiya/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/locator.dart';
import 'core/services/notification/push_notification/push_notification.dart';
 final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await CacheHelper.init();
  setupServiceLocator();

  await Future.wait([
    PushNotification.init(),
    LocalNotificationService.init(),
  ]);
  runApp(const AlDahabiya());
}
class AlDahabiya extends StatelessWidget {
  const AlDahabiya({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          routerConfig: AppRouters.router,
        );
      },
    );
  }
}