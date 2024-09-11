import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/location_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PageTitleBar extends StatelessWidget {
  PageTitleBar({super.key, required this.isTitlePade, this.pageTitle});
  bool isTitlePade = false;
  String? pageTitle = '';
  @override
  Widget build(BuildContext context) {
    return isTitlePade
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Directionality(
                  textDirection: TextDirection.ltr, child: LocationBadge()),
              Row(
                children: [
                  Text(
                    pageTitle!,
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  InkWell(
                      onTap: () =>
                          GoRouter.of(context).push(AppRouters.kFirstRoute),
                      child: Icon(
                        Icons.arrow_back,
                        size: 20.sp,
                        textDirection: TextDirection.rtl,
                      )),
                ],
              )
            ],
          )
        : const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Directionality(
                  textDirection: TextDirection.ltr, child: LocationBadge()),
            ],
          );
  }
}
