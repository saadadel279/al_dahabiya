import 'package:al_dahabiya/feature/home/presentation/widgets/offer_list_item.dart';
import 'package:flutter/material.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const OfferListItem();
      },
    );
  }
}
