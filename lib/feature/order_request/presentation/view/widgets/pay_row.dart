import 'package:al_dahabiya/feature/cart/presentation/view_mode/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayRow extends StatelessWidget {
  const PayRow({
    super.key,
  });

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
                    child: ElevatedButton(
                      onPressed: () {
                        // context.read<CartCubit>().clearTable();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB13E55),
                      ),
                      child: const Text(
                        'شراء',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
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
