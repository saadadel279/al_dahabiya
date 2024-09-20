import 'package:al_dahabiya/feature/home/data/models/offers_model.dart';
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
        imageUrl: offer!.image!,
        placeholder: (context, url) => const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
