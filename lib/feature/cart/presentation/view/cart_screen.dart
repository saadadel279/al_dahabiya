import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/cart_item_model.dart';
import '../view_mode/cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit()..loadInitialItems(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 15.h),
                PageTitleBar(
                  isTitlePade: true,
                  pageTitle: 'عربة التسوق',
                ),
                SizedBox(height: 15.h),
                Expanded(
                  child: BlocBuilder<CartCubit, List<CartItemModel>>(
                    builder: (context, cartItems) {
                      return ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 15.h),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF5E3E7),
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 4.h,
                                  horizontal: 5.w,
                                ),
                                child: Card(
                                  color: Colors.white,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 8.h),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0.sp),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              item.imageUrl,
                                              width: 50.w,
                                              height: 50.h,
                                            ),
                                            SizedBox(width: 10.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.name,
                                                  style: TextStyle(
                                                      fontSize: 18.sp),
                                                ),
                                                SizedBox(height: 4.h),
                                                Text(
                                                  "${item.price} ج.م",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFB0EAFD),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: IconButton(
                                                iconSize: 26.sp,
                                                icon: const Icon(Icons.remove),
                                                onPressed: () => context
                                                    .read<CartCubit>()
                                                    .decrementQuantity(index),
                                              ),
                                            ),
                                            SizedBox(width: 16.w),
                                            Text(
                                              '${item.quantity}',
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(width: 16.w),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFB0EAFD),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: IconButton(
                                                iconSize: 26.sp,
                                                icon: const Icon(Icons.add),
                                                onPressed: () => context
                                                    .read<CartCubit>()
                                                    .incrementQuantity(index),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: BlocBuilder<CartCubit, List<CartItemModel>>(
                    builder: (context, cartItems) {
                      final totalPrice =
                          context.read<CartCubit>().getTotalPrice();
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'المجموع: ',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' ${totalPrice.toStringAsFixed(2)} ج.م',
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
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFB13E55),
                                ),
                                child: const Text(
                                  'شراء',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
