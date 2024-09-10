import 'package:al_dahabiya/feature/home/presentation/widgets/item_data.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferListItem extends StatelessWidget {
  const OfferListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Color.fromARGB(255, 119, 118, 118),
            width: 0.5,
          ),
        ),
        child: SizedBox(
          height: 105.h,
          width: 250.w,
          child: const Row(
            children: [
              Expanded(child: ItemImage()),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ItemData(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
