import 'package:al_dahabiya/feature/profile/presentation/widgets/log_out_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_router.dart';
import '../widgets/profile_tab.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          color: const Color(0xFFD04430),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40.sp,
                      child: Image.asset(
                        'assets/images/profile.png',
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'JOHN DOE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '01235689456',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                        Text(
                          'شارع الشهداء الشرقي',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Column(
                  children: [
                    ProfileTab(
                      icon: Icons.location_on_outlined,
                      title: 'العنوان',
                      onTap: () {
                        GoRouter.of(context).push(AppRouters.kAddressScreen);
                      },
                    ),
                    ProfileTab(
                      icon: Icons.lock_open_outlined,
                      title: 'تغيير كلمة المرور',
                      onTap: () {},
                    ),
                    const LogOutText()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
