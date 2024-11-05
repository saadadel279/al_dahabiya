import 'dart:developer';

import 'package:al_dahabiya/core/api/dio_consumer.dart';
import 'package:al_dahabiya/core/database/sql_db.dart';
import 'package:al_dahabiya/core/widgets/app_page_title.dart';
import 'package:al_dahabiya/feature/address/presentation/view_model/cubit/address_cubit.dart';
import 'package:al_dahabiya/feature/cart/data/repo/cart_repo.dart';
import 'package:al_dahabiya/feature/cart/presentation/view_mode/cubit/cart_cubit.dart';
import 'package:al_dahabiya/feature/home/presentation/view/widgets/category_title_row.dart';
import 'package:al_dahabiya/feature/order_request/data/repo/order_request.dart';
import 'package:al_dahabiya/feature/order_request/presentation/view_model/cubit/order_request_cubit.dart';
import 'package:dio/dio.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_router.dart';
import '../../../address/data/models/user_address_model.dart';
import '../../../address/presentation/view/widgets/drop_down_function.dart';
import '../../../address/presentation/view/widgets/semulated_drop_down.dart';
import 'widgets/data_row.dart';
import 'widgets/fatora_details_row.dart';
import 'widgets/order_request_item.dart';
import 'widgets/pay_row.dart';

class OrderRequestScreen extends StatefulWidget {
  const OrderRequestScreen({super.key});

  @override
  State<OrderRequestScreen> createState() => _OrderRequestScreenState();
}

List<AddressData>? addressData;
String orderAddressId = '0';
String orderAddress = "";
double shipingCost = 0.0;
bool isLoading = false;

class _OrderRequestScreenState extends State<OrderRequestScreen> {
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
      child: BlocListener<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is GetUserAddressLoading) {
            setState(() {
              isLoading = true;
            });
          } else if (state is GetUserAddressSuccess) {
            setState(() {
              addressData = state.addressData;
              isLoading = false;
            });
          } else if (state is GetUserAddressFailure) {
            setState(() {
              isLoading = false;
            });
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  children: [
                    SafeArea(child: SizedBox(height: 15.h)),
                    PageTitleBar(isTitlePade: true, pageTitle: 'عملية الشراء'),
                    SizedBox(height: 15.h),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              log(addressData.toString());
                              final List<SelectedListItem> addressItems =
                                  addressData!
                                      .map((add) => SelectedListItem(
                                            address: '',
                                            name: add.address,
                                            value: add.id.toString(),
                                            shapingCost:
                                                add.shippingCost.toString(),
                                          ))
                                      .toList();
                              dropDown(
                                title: 'اختر عنوانك الحالي من هنا',
                                data: addressItems,
                                onSelected: (SelectedListItem selectedItem) {
                                  setState(() {
                                    orderAddress = selectedItem.name;
                                    orderAddressId = selectedItem.value;
                                    shipingCost =
                                        double.parse(selectedItem.shapingCost);
                                  });
                                },
                              ).showModal(context);
                            },
                            child: const SemulatedDropDown(
                              title: 'عنوان الطلب',
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    DataRowItem(
                      data: orderAddress,
                      icon: const Icon(Icons.location_on_outlined),
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
                          return const Center(
                              child: CircularProgressIndicator());
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
                                  return OrderRequestItem(
                                      cartItem: cartItems[index]);
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
                          return const Center(
                              child: CircularProgressIndicator());
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
                    FatoraDetailsRow(
                        fatoraCount: shipingCost, fatoraTitle: 'سعر الشحن'),
                    SizedBox(height: 15.h),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        if (state is CartSuccess) {
                          return PayRow(
                            addressId: int.parse(orderAddressId),
                            shipingCost: shipingCost,
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
                          onPressed: () {
                            context.read<CartCubit>().clearTable();
                            GoRouter.of(context).push(AppRouters.kFirstRoute);
                          },
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
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
