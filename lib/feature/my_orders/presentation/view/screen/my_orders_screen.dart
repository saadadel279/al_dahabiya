import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_page_title.dart';
import '../widgets/cancel_orders_button.dart';
import '../widgets/my_order_details.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: SafeArea(
              child: Column(children: [
            SizedBox(height: 15.h),
            PageTitleBar(
              isTitlePade: true,
              pageTitle: 'طلباتي',
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 600.h,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20.0.r),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#طلب رقم ${index + 1}',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            const Text(
                              '11/11/2024',
                              style: TextStyle(color: Colors.black),
                            ),
                            const MyOrderDetailsItem(
                              title: 'سعر الشحن: ',
                              details: '10 ج.م',
                            ),
                            const MyOrderDetailsItem(
                              title: 'المجموع: ',
                              details: '20 ج.م',
                            ),
                            const MyOrderDetailsItem(
                              title: 'الحالة: ',
                              details: 'مكتملة',
                            ),
                            const CancelOrderButton()
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 15.h);
                },
              ),
            )
          ])),
        ),
      ),
    );
  }
}
