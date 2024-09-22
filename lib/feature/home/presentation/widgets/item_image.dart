import 'package:al_dahabiya/feature/offers/data/models/offers_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    this.offer,
  });
  final Offer? offer;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      child: CachedNetworkImage(
        imageUrl: 'http://walker-stores.com/images/${offer!.image}',
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
        fit: BoxFit.fill,
      ),
    );
  }
}
