import 'package:flutter/material.dart';

class PageHintText extends StatelessWidget {
  const PageHintText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ));
  }
}
