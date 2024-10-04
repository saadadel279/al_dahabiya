import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/database/sql_db.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/cart/data/repo/cart_repo.dart';
import 'package:al_dahabiya/feature/cart/presentation/view_mode/cubit/cart_cubit.dart';
import 'package:al_dahabiya/feature/home/presentation/view/widgets/category_title_row.dart';
import 'package:al_dahabiya/feature/order_request/data/repo/order_request.dart';
import 'package:al_dahabiya/feature/order_request/presentation/view_model/cubit/order_request_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cart/data/models/cart_item_model.dart';
import 'widgets/data_row.dart';
import 'widgets/fatora_details_row.dart';
import 'widgets/order_request_item.dart';
import 'widgets/pay_row.dart';

class OrderRequestScreen extends StatelessWidget {
  OrderRequestScreen({super.key});
  List<CartItemModel>? cartItem;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CartCubit(CartRepo(sqlDB: SqlDB()))..getCartItem(),
        ),
        BlocProvider(
          create: (context) => OrderRequestCubit(
              OrderRequestRepo(apiServices: DioConsumer(dio: Dio()))),
        )
      ],
      child: Scaffold(
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
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if (state is CartSuccess) {
                        cartItem = state.cartItems;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.cartItems.length,
                          itemBuilder: (context, index) {
                            return OrderRequestItem(
                              cartItem: state.cartItems[index],
                            );
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartSuccess) {
                    return FatoraDetailsRow(
                      fatoraCount: state.totalPrice,
                      fatoraTitle: 'سعر الطلبات',
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              SizedBox(height: 15.h),
              const FatoraDetailsRow(
                fatoraCount: 50,
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
      ),
    );
  }
}
