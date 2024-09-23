import 'package:al_dahabiya/feature/home/presentation/view/widgets/item_data.dart';
import 'package:al_dahabiya/feature/home/presentation/view/widgets/item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/offers_model.dart';

class OfferListItem extends StatelessWidget {
  const OfferListItem({
    super.key,
    this.offer,
  });
  final Offer? offer;

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
          child: Row(
            children: [
              Expanded(
                  child: ItemImage(
                offer: offer,
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemData(
                    offer: offer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
