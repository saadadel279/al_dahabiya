import 'package:al_dahabiya/core/api/end_point.dart';
import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/database/cashe_helper.dart';
import 'package:al_dahabiya/core/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class logOutBadge extends StatelessWidget {
  const logOutBadge({
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
        width: 120.w,
        height: 35.h,
        decoration: const BoxDecoration(
          color: Color(0xFFEE6A61),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(20)),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            SizedBox(width: 10.w),
            const Text(
              'log out',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
