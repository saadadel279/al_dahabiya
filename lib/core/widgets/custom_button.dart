import 'package:al_dahabiya/core/widgets/custom.loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.title,
    required this.isloading,
  });

  final void Function()? onTap;
  final String title;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 330.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: const Color(0xFFFD8700),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: isloading
              ? CustomLoading(isloading: isloading)
              : Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
