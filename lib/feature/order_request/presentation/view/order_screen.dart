import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/home/presentation/view/widgets/category_title_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/data_row.dart';
import 'widgets/fatora_details_row.dart';
import 'widgets/order_request_item.dart';
import 'widgets/pay_row.dart';

class OrderRequestScreen extends StatelessWidget {
  const OrderRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Column(
          children: [
            SafeArea(
              child: SizedBox(height: 15.h),
            ),
            PageTitleBar(
              isTitlePade: true,
              pageTitle: 'عملية الشراء',
            ),
            SizedBox(height: 15.h),
            const DataRowItem(
              data: '3 شارع الملك خالد بن عبد الرحمن',
              icon: Icon(Icons.location_on_outlined),
            ),
            SizedBox(height: 15.h),
            const DataRowItem(
              data: '13:00 today 22 july',
              icon: Icon(Icons.schedule_outlined),
            ),
            SizedBox(height: 20.h),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: CategoryTitleRow(
                isBoold: true,
                categoryName: 'الطلبيات',
              ),
            ),
            SizedBox(
              height: 150.h,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const OrderRequestItem();
                  },
                ),
              ),
            ),
            SizedBox(height: 15.h),
            const FatoraDetailsRow(
              fatoraCount: 91,
              fatoraTitle: 'سعر الطلبات',
            ),
            SizedBox(height: 15.h),
            const FatoraDetailsRow(
              fatoraCount: 5,
              fatoraTitle: 'سعر الشحن',
            ),
            SizedBox(height: 15.h),
            const PayRow(),
            SizedBox(height: 15.h),
            SizedBox(
              width: 250.w,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () {
                  // context.read<CartCubit>().clearTable();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF6F3F4),
                ),
                child: const Text(
                  'الغاء الطلبيات',
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
