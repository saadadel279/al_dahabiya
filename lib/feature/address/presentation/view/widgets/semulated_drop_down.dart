import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SemulatedDropDown extends StatelessWidget {
  const SemulatedDropDown({
    super.key,
    this.title,
  });
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color.fromARGB(255, 241, 241, 240),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.arrow_drop_down,
              color: Color.fromARGB(255, 78, 78, 78),
              size: 30,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                title!,
                style: const TextStyle(
                  color: Color.fromARGB(255, 78, 78, 78),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
