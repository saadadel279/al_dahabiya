import 'package:flutter/material.dart';

import '../../data/models/offers_model.dart';

class ItemData extends StatelessWidget {
  const ItemData({
    super.key,
    this.offer,
  });
  final Offer? offer;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          offer?.name ?? 'عرض ال 5 فطع',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
        Text(
          offer?.name ?? '5 قطع',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        const Row(
          children: [
            Text(
              '12\$',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 5),
            Text(
              '18\$',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
