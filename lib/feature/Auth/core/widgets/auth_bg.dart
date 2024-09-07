import 'package:flutter/material.dart';

class AuthBg extends StatelessWidget {
  const AuthBg({super.key, this.child});

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFD04430), child: child);
  }
}
