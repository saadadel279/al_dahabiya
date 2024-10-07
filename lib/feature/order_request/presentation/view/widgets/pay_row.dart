import 'package:al_dahabiya/feature/cart/presentation/view_mode/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cart/data/models/cart_item_model.dart';
import '../../../data/models/order_request_model.dart';
import '../../view_model/cubit/order_request_cubit.dart';

class PayRow extends StatelessWidget {
  const PayRow({
    super.key,
    required this.cartItemsInOrder,
  });

  final List<CartItemModel> cartItemsInOrder;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 70.h,
        color: const Color(0xFFF6F3F4),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartSuccess) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'المجموع: ',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' ${state.totalPrice! + 50} ج.م',
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
                    child: Builder(builder: (context) {
                      return ElevatedButton(
                        onPressed: () async {
                          const address = 31;
                          const coupon = "";
                          const paymentType = "الدفع عند الاستلام";
                          const deliveryTime = "sdfds";
                          const comment = "";
                          const points = 0;

                          final List<ProductData> products =
                              cartItemsInOrder.map((cartItem) {
                            return ProductData(
                              productId: cartItem.id,
                              option1: -1,
                              option2: -1,
                              q: cartItem.quantity,
                            );
                          }).toList();

                          final orderRequestModel = OrderRequestModel(
                            address: address,
                            coupon: coupon,
                            paymentType: paymentType,
                            deliveryTime: deliveryTime,
                            comment: comment,
                            points: points,
                            data: products,
                          );

                          await context
                              .read<OrderRequestCubit>()
                              .orderRequest(orderRequestModel);
                          context.read<CartCubit>().clearTable();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB13E55),
                        ),
                        child:
                            BlocBuilder<OrderRequestCubit, OrderRequestState>(
                          builder: (context, state) {
                            if (state is OrderRequestSuccess) {
                              return const Text(
                                'تم الطلب بنجاح',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              );
                            } else if (state is OrderRequestFailure) {
                              return const Text(
                                textAlign: TextAlign.center,
                                'من فضلك حاول مرة اخرى',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              );
                            } else if (state is OrderRequestLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              );
                            } else {
                              return const Text(
                                'شراء',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              );
                            }
                          },
                        ),
                      );
                    }),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
