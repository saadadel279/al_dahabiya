import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FatoraDetailsRow extends StatelessWidget {
  const FatoraDetailsRow({super.key, this.fatoraCount, this.fatoraTitle});
  final int? fatoraCount;
  final String? fatoraTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(fatoraCount!.toString(),
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(fatoraTitle!,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
