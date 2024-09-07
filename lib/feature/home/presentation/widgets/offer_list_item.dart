import 'package:al_dahabiya/feature/home/presentation/widgets/item_data.dart';
import 'package:al_dahabiya/feature/home/presentation/widgets/item_image.dart';
import 'package:flutter/material.dart';

class OfferListItem extends StatelessWidget {
  const OfferListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: const SizedBox(
          width: 250,
          child: Row(
            children: [
              ItemImage(),
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
