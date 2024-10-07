import 'package:al_dahabiya/core/models/product_model.dart';

class FavoritesProductModel {
  Product product;
  bool isFavorite;

  FavoritesProductModel({
    required this.product,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
  }

  factory FavoritesProductModel.fromJson(Map<String, dynamic> json) {
    return FavoritesProductModel(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }
}
