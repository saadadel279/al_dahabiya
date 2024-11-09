import 'package:al_dahabiya/feature/my_orders/presentation/view_model/my_orsers_cubit/my_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_page_title.dart';
import '../widgets/cancel_orders_button.dart';
import '../widgets/my_order_details.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MyOrdersCubit, MyOrdersState>(
        listener: (context, state) {
          if (state is CancelOrderSuccses) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            context.read<MyOrdersCubit>().getMyOrders();
          } else if (state is MyOrdersFailure || state is CancelOrderFailure) {
            final errMessage = state is MyOrdersFailure
                ? state.errMessage
                : (state as CancelOrderFailure).errMessage;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errMessage)),
            );
          }
        },
        builder: (context, state) {
          if (state is MyOrdersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MyOrderSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: 15.h),
                      PageTitleBar(
                        isTitlePade: true,
                        pageTitle: 'طلباتي',
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        height: 600.h,
                        child: ListView.separated(
                          itemCount: state.myOrdersModel.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final order = state.myOrdersModel.data[index];

                            final borderColor = order.status == 'جديد'
                                ? Colors.green
                                : Colors.grey;

                            final textColor = order.status == 'جديد'
                                ? Colors.green
                                : Colors.red;

                            return Container(
                              height: 200.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  color: borderColor,
                                ),
                                borderRadius: BorderRadius.circular(20.0.r),
                              ),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '#طلب رقم ${order.id}',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        order.date,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      MyOrderDetailsItem(
                                        title: 'سعر الشحن: ',
                                        details: order.shipping.toString(),
                                      ),
                                      MyOrderDetailsItem(
                                        title: 'المجموع: ',
                                        details: order.total.toString(),
                                      ),
                                      MyOrderDetailsItem(
                                        title: 'الحالة: ',
                                        details: order.status,
                                      ),
                                      order.status == "تم الالغاء"
                                          ? Text(
                                              "تم الغاء الطلب",
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                context
                                                    .read<MyOrdersCubit>()
                                                    .cancelOrder(order.id);
                                              },
                                              child: const CancelOrderButton(),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 15.h);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
