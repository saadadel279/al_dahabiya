import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
    required this.isloading,
  });

  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      blur: 1,
      opacity: 0,
      color: Colors.white,
      inAsyncCall: isloading,
      child: const Text(''),
    );
  }
}
