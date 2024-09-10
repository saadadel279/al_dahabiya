import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      child: Image.asset(
        'assets/images/product.jpeg',
        fit: BoxFit.cover,
        width: 100,
        height: 150,
      ),
    );
  }
}
