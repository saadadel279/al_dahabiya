import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_router.dart';

class PayRow extends StatelessWidget {
  const PayRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 70.h,
        color: const Color(0xFFF6F3F4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'المجموع: ',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' ${50} ج.م',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: 150.w,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context)
                      .push(AppRouters.kOrderRequestScreenRoute);
                  // context.read<CartCubit>().clearTable();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB13E55),
                ),
                child: const Text(
                  'شراء',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
