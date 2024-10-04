import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cart/data/models/cart_item_model.dart';

class OrderRequestItem extends StatelessWidget {
  const OrderRequestItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          CachedNetworkImage(
              height: 85.h,
              fit: BoxFit.fill,
              imageUrl: 'http://walker-stores.com/images/${cartItem.imageUrl}'),
          SizedBox(height: 10.h),
          Text(
            cartItem.name,
            style: TextStyle(fontSize: 16.sp),
          ),
          Text(
            '${cartItem.price * cartItem.quantity} ج.م',
            style: TextStyle(color: Colors.red, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
