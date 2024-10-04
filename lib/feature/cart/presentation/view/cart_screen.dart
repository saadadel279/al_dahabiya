import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/database/sql_db.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/cart/data/repo/cart_repo.dart';
import 'package:al_dahabiya/feature/cart/presentation/view_mode/cubit/cart_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(CartRepo(sqlDB: SqlDB()))..getCartItem(),
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
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CartSuccess) {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.cartItems.length,
                                itemBuilder: (context, index) {
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CachedNetworkImage(
                                                      imageUrl:
                                                          'http://walker-stores.com/images/${state.cartItems[index].imageUrl}',
                                                      width: 50.w,
                                                      height: 50.h,
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          state.cartItems[index]
                                                              .name,
                                                          style: TextStyle(
                                                              fontSize: 18.sp),
                                                        ),
                                                        SizedBox(height: 4.h),
                                                        Text(
                                                          "${state.cartItems[index].price} ج.م",
                                                          style:
                                                              const TextStyle(
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
                                                    const Text(
                                                      'الكمية:',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      ' ${state.cartItems[index].quantity.toString()}',
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          ' ${state.totalPrice ?? 0.0} ج.م',
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
                                          GoRouter.of(context).push(AppRouters
                                              .kOrderRequestScreenRoute);
                                          // context.read<CartCubit>().clearTable();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFB13E55),
                                        ),
                                        child: const Text(
                                          'شراء',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is CartFailure) {
                        return Center(
                            child:
                                Image.asset('assets/images/empety_cart.png'));
                      } else if (state is ClearTableSuccess) {
                        return Center(
                            child:
                                Image.asset('assets/images/empety_cart.png'));
                      } else {
                        return const SizedBox.shrink();
                      }
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
