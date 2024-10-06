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

import 'widgets/data_row.dart';
import 'widgets/fatora_details_row.dart';
import 'widgets/order_request_item.dart';
import 'widgets/pay_row.dart';

class OrderRequestScreen extends StatelessWidget {
  const OrderRequestScreen({super.key});

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
            OrderRequestRepo(apiServices: DioConsumer(dio: Dio())),
          ),
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            children: [
              SafeArea(child: SizedBox(height: 15.h)),
              PageTitleBar(isTitlePade: true, pageTitle: 'عملية الشراء'),
              SizedBox(height: 15.h),
              const DataRowItem(
                data: '3 شارع الملك خالد بن عبد الرحمن',
                icon: Icon(Icons.location_on_outlined),
              ),
              SizedBox(height: 15.h),
              const DataRowItem(
                data: '13:00 today 22 July',
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
              SizedBox(height: 15.h),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CartFailure) {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                              'Failed to load cart items: ${state.errorMessage}'),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    );
                  } else if (state is CartSuccess) {
                    final cartItems = state.cartItems;
                    if (cartItems.isEmpty) {
                      return const Center(
                        child: Text('No items in your cart',
                            style: TextStyle(fontSize: 18)),
                      );
                    }

                    return SizedBox(
                      height: 150.h,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            return OrderRequestItem(cartItem: cartItems[index]);
                          },
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: 15.h),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CartFailure) {
                    return Center(
                      child: Text(
                          'Failed to load total price: ${state.errorMessage}'),
                    );
                  } else if (state is CartSuccess) {
                    return FatoraDetailsRow(
                      fatoraCount: state.totalPrice,
                      fatoraTitle: 'سعر الطلبات',
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: 15.h),
              const FatoraDetailsRow(fatoraCount: 50, fatoraTitle: 'سعر الشحن'),
              SizedBox(height: 15.h),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartSuccess) {
                    return PayRow(
                      cartItemsInOrder: state.cartItems,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: 250.w,
                height: 45.h,
                child: Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () => context.read<CartCubit>().clearTable(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6F3F4),
                    ),
                    child: const Text(
                      'الغاء الطلبيات',
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
