import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearshTap extends StatelessWidget {
  const SearshTap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF5F7F9),
          hintText: 'اكتب هنا اللي بتدور علية',
          hintStyle: TextStyle(
            fontSize: 14.sp,
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.mic_none_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
