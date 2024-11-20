import 'package:al_dahabiya/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearshTap extends StatelessWidget {
  const SearshTap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(AppRouters.kSearchScreen),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[350],
             borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              const Icon(Icons.search),
              Text('اكتب هنا اللي بتدور علية',style: TextStyle(fontSize: 14.sp),),
              const Icon(Icons.mic_none_outlined)
            ],),
          ),
        ),
        // TextField(
        //   decoration: InputDecoration(
        //     filled: true,
        //
        //     fillColor: const Color(0xFFF5F7F9),
        //     hintText: 'اكتب هنا اللي بتدور علية',
        //     hintStyle: TextStyle(
        //       fontSize: 14.sp,
        //     ),
        //     prefixIcon: const Icon(Icons.search),
        //     suffixIcon: const Icon(Icons.mic_none_outlined),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
