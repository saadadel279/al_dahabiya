import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_page_title.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../widgets/drop_down_function.dart';
import '../widgets/semulated_drop_down.dart';
import '../widgets/simulated_titiled_drop_down.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 15.h),
                PageTitleBar(
                  isTitlePade: true,
                  pageTitle: 'العناوين',
                ),
                SizedBox(height: 15.h),

                // Button to trigger the dropdown modal
                InkWell(
                  onTap: () {
                    dropDown(title: 'اختر عنوانك الحالي من هنا', data: [
                      SelectedListItem(name: 'المنوفية'),
                      SelectedListItem(name: 'القاهرة'),
                      SelectedListItem(name: 'الاسكندرية'),
                    ]).showModal(context);
                  },
                  child: const SemulatedDropDown(
                    title: 'اختر عنوانك الحالي من هنا...',
                  ),
                ),

                // Placeholder for address items list
                SizedBox(height: 15.h),
                Text('اضف عنوان جديد',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 85, 85, 85),
                    )),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () {
                    dropDown(title: 'اختر المحافظة', data: [
                      SelectedListItem(name: 'المنوفية'),
                      SelectedListItem(name: 'القاهرة'),
                      SelectedListItem(name: 'الاسكندرية'),
                    ]).showModal(context);
                  },
                  child: const SimulatedTiteldDropDown(
                    hint: 'اختر المحافظة...',
                    title: 'المحافظة',
                  ),
                ),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () {
                    dropDown(title: 'اختر المدينة', data: [
                      SelectedListItem(name: 'شبين الكوم'),
                      SelectedListItem(name: 'تلا'),
                      SelectedListItem(name: 'قويسنا'),
                    ]).showModal(context);
                  },
                  child: const SimulatedTiteldDropDown(
                    hint: 'اختر المدينة...',
                    title: 'المدينة',
                  ),
                ),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () {
                    dropDown(title: 'اختر المنطقة', data: [
                      SelectedListItem(name: 'شنوان'),
                      SelectedListItem(name: 'كفر شنوان'),
                      SelectedListItem(name: 'بحري'),
                    ]).showModal(context);
                  },
                  child: const SimulatedTiteldDropDown(
                    hint: 'اختر المنطقة...',
                    title: 'المنطقة',
                  ),
                ),
                SizedBox(height: 15.h),
                CustomButton(
                  title: 'اضافة عنوان جديد',
                  onTap: () {},
                  isloading: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
