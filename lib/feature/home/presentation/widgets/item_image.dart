import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        'assets/images/Logo-removebg-preview.png',
        fit: BoxFit.cover,
        width: 100,
        height: 150,
      ),
    );
  }
}
