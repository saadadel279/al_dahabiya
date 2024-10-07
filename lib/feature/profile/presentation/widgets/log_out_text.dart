import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_router.dart';
import '../../../../core/services/locator.dart';

class LogOutText extends StatelessWidget {
  const LogOutText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<CacheHelper>().removeData(
          key: ApiKey.token,
        );
        GoRouter.of(context).pushReplacement(AppRouters.kLoginRoute);
      },
      child: Container(
        height: 70.h,
        color: Colors.white,
        child: Center(
          child: Text(
            'تسجيل الخروج',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
        ),
      ),
    );
  }
}
